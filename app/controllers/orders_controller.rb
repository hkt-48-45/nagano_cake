class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @address = current_customer.address
    @address = Address.new
    @order = Order.new
  end

  def create
  end
  
  def edit
  end
  
  def edit
  end

  def destroy
  end
end
