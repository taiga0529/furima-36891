class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @article.save
      redirect_to root_path
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :burden_id, :area_id, :days_id, :user_id, :image)
  end
end
