class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page])
    @customers = @order.customer
    @order_details = @order.order_detail
  end

end


