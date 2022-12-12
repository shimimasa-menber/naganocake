class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     flash[:notice] = "You have created book successfully."
     redirect_to admin_item_path(@item.id)
    else
     render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:genre,:price,:is_active)
  end

end



