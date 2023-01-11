class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = @order.order_detail 
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_detail_params
    params.require(:order_details).permit(:making_status)
  end

end

