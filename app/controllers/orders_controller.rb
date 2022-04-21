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
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1}
    @order.total_payment = @total_price + @order.shipping_cost

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1}
    @order.shipping_cost = 800
    render 'confirm'

  end

  def log
  end



  def complete
  end

  private
  def order_params
    params.require(:order).permit(:post_number, :address, :name, :payment_method, :customer_id, :status)
  end
end
