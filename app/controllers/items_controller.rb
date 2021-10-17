class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
       @item = Item.create(items_params)
       if @item.save
        redirect_to root_path
     else
      render :new
     end
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :explanation, :image, :days_id, :area_id, :category_id, :status_id, :burden_id).merge(user_id: current_user.id)
  end
  def redirect_root
    redirect_to user_session_path unless user_signed_in?
  end
end
