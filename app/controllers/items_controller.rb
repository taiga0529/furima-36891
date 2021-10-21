class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    #@items = Item.includes(:user).order("created_at DESC")
    @items = Item.order('created_at DESC')
    # @item=Item.find(params[:id])
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
    @item=Item.find(params[:id])
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
    redirect_to root_path if @item.purchase_history.present?
  #トップページへ戻す if 商品が売れていたら
end

  def update
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


  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless  current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end
