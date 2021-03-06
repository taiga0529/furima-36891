class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :address, :telephone_number, :building_name, :purchase_history_id, :municipalities, :user_id, :item_id, :token
  validates :postcode,format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :telephone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  with_options presence: true do
     validates :user_id
     validates :item_id 
     validates :token
     validates :municipalities
     validates :address
     validates :postcode
  end
  def save
    purchase_histories = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, municipalities: municipalities, area_id: area_id, telephone_number: telephone_number, building_name: building_name, address: address, purchase_history_id: purchase_histories.id)
  end
end