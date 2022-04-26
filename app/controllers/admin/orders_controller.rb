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
    @order_details = @order.order_details
		if @order.update(order_params)
		   flash[:success] = "注文ステータスを変更しました"
  	   if @order.status == "payment_confirmation"
        @order_details.each do |order_detail|
         order_detail.making_status = "waiting_for_production"
         order_detail.save
        end
       end
		   redirect_to admin_top_path(@order)
		else
		   redirect_to admin_order_path(@order)
		end
  end

  private
	def order_params
		  params.require(:order).permit(:status)
	end
end
