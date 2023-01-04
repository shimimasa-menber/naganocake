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
  end

  def complete
  end
  
  def order_params
  params.require(:order).permit(:payment_method)
  end
  
end

