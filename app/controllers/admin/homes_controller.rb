class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page])
    @customers = Customer.page(params[:page])
    @order_details = OrderDetail.page(params[:page])
  end

end


