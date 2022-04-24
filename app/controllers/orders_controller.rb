class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total_price = @order_details.sum{|order_detail|order_detail.item.price * order_detail.amount * 1.1}
  end

  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1}
    @order.shipping_cost = 800
    @order.total_payment = @total_price + @order.shipping_cost
    # 上手く反映されない
    # @order.status = 0

    # ご自身の住所、登録済住所、新しいお届け先で場合分けs
    if  params[:order][:address_s] == "0"
      @order.post_number = current_customer.post_number
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_s] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_number = @address.post_number
      @order.address = @address.address
      @order.name = @address.name
    else
    end
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0

    @order.save
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.save
    end
    current_customer.cart_items.all.destroy_all
    flash[:notice] = "ご注文が確定しました。"
    render 'complete'
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:post_number, :address, :name, :payment_method, :customer_id, :shipping_cost, :total_payment, :status)
  end
end