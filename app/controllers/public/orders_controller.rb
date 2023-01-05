class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def show
  end

  def index
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry
    if params[:order][:select_address] == "1"

    elsif params[:order][:select_address] == "2"

    else params[:order][:select_address] == "3"

    end
  end

  def complete
  end

  private
  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
