class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :address, :telephone_number, :building_name, :purchase_history_id, :municipalities, :user_id, :item_id, :token
  validates :postcode, presence: true
  validates :postcode,format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  #validates :purchase_history_id, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :address, presence: true
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :telephone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  #validates :telephone_number, numericality
  validate :user_id
  validate :item_id 
  validate :building_name
  validates :token, presence: true

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase_histories = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postcode: postcode, municipalities: municipalities, area_id: area_id, telephone_number: telephone_number, building_name: building_name, address: address, purchase_history_id: purchase_histories.id)
  end
end