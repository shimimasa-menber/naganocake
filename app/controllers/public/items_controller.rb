class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.page(params[:page])
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = @item.cart_item
  end

end
