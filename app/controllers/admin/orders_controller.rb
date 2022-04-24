class Admin::OrdersController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1}
  end

  def update
    @order = Order.find(params[:id])
		if @order.update(order_params)
		   flash[:success] = "注文ステータスを変更しました"
		   redirect_to admin_top_path(@order)
		else
		   render "show"
		end
  end
  
  private
	def order_params
		  params.require(:order).permit(:status)
	end
end
