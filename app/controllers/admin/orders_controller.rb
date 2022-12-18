class Admin::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @items = @order.items
  end

  def update
     @order = Order.find(params[:id])
      if @order.update(order_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to admin_order_path(@order.id)
      else
        render :show
      end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end


