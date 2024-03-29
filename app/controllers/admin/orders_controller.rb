class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
  end

  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     redirect_to admin_order_path(@order.id)
     #order_details = @order.order_details
    # order_details.update(order_details_params)
    # redirect_to admin_order_path(@order.id)

  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end


