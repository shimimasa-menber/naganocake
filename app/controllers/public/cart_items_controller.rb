class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).amount += params[:cart_item][:number].to_i
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :price, :customer_id, :image)
  end

end
