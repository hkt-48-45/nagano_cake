class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
	  if @order_detail.update(order_detail_params)
		 flash[:success] = "制作ステータスを変更しました"
		  if params[:order_detail][:making_status] == "producing"
             @order_detail.order.status = "in_production"
             @order.save
          elsif @order.order_details.count == @order.order_details.where(making_status: "production_completed").count
             @order.status = "preparing_to_ship"
             @order.save
		       redirect_to admin_top_path(@order_detail.order)
		  else
		     @order_details = @order.order_details.all
             @total_price = @order_details.sum{|order_detail|order_detail.item.price * order_detail.amount * 1.1}
		       render "admin/orders/show"
		  end
	end
end
  private
	def order_detail_params
		params.require(:order_detail).permit(:making_status)
	end
end

