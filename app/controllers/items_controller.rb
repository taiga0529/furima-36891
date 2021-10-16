class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :burden_id, :area_id, :days_id, :user_id, :image)
  end
end
