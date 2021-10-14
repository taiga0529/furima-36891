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
    params.require(:item).permit(:name, :image, :text)
  end
end
