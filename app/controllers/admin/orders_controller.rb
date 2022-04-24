class Admin::OrdersController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    puts "————————"
    puts @order_details.inspect
    @order_details = @order.order_details.all
    @total_price = @order_details.sum{|order_detail|order_detail.item.price * order_detail.amount * 1.1}
    
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
