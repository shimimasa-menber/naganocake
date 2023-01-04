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
    if params[:order][:address_option] == "1"
      
    elsif params[:order][:address_option] == "2"
      
    else params[:order][:address_option] == "3"
      
    end
  end

  def complete
  end
end
