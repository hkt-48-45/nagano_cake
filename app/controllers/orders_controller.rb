class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @customer = current_customer
    @order = Order.new
    @order.customer_id = current_customer.id
    @addresses = Address.where(customer_id: current_customer.id)
    # @order_details = Cart.where(customer_id: @customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to new_customer_order_path(current_customer), notice: "You have created order successfully."
    else
      @customer = current_customer
      @addresses = Order.where(customer_id: current_customer.id)
      render 'new'
    end

  end

  def log
  end



  def complete
  end

  private
  def order_params
    params.require(:order).permit(:post_number, :order, :name, :total_payment, :shipping_cost, :payment_method, :status, :customer_id)
  end
end
