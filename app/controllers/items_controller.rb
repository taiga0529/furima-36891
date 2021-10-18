class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit]
  before_action :move_to_index, only: [:edit]

  def index
    #@items = Item.includes(:user).order("created_at DESC")
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
  end
end


  private

  def items_params
    params.require(:item).permit(:name, :price, :explanation, :image, :days_id, :area_id, :category_id, :status_id,
                                 :burden_id).merge(user_id: current_user.id)
  end

  def redirect_root
    redirect_to user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless  current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end
