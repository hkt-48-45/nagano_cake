class OrdersController < ApplicationController
  def index
  end

  def show
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
  end

    # ご自身の住所、登録済住所、新しいお届け先で場合分け
    # if @order.address == "your_address"
      # @order.post_number = current_customer.post_number
      # @order.address = current_customer.address
      # @order.name = current_customer.first_name + current_customer.last_name

    # elsif address "record_address"
      # record = Address.find(params[:order][:address_id])
      # @order.post_number = record.post_number
      # @order.address     = record.address
      # @order.name        = record.name
    # else
    # end



    # end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    @order.save
    current_customer.cart_items.all.destroy_all
    flash[:notice] = "ご注文が確定しました。"
    render 'complete'
  end


  def log
  end



  def complete
  end

  private
  def order_params
    params.require(:order).permit(:post_number, :address, :name, :payment_method, :customer_id, :shipping_cost, :total_payment, :status)
  end
end