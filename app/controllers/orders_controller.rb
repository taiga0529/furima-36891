class OrdersController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @item=Item.find(params[:item_id])
  end

  def new
  end

  def create
    @item=Item.find(params[:item_id])
    @purchase_address=PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path 
    else
      render :index
  end
end

  private

  def purchase_params
    params.permit(:postcode, :area_id, :municipalities, :telephone_number, :building_name, :address).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key = "sk_test_87bfbe47dec14d3d63b05d2f"  
      Payjp::Charge.create(
        amount:@item.price,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end
end
