require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名は空でも登録できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '新規登録できない場合' do
      it '郵便番号が空では購入できない' do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it '市区町村が空では購入できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '地域が空では購入できない' do
        @purchase_address.area_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁の半角文字列以外では購入できない' do
        @purchase_address.postcode = '１１１１−１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode is invalid")
      end
      it '電話番号が10桁以上11桁以内の半角数値以外では購入できない' do
        @purchase_address.telephone_number = '０８０−１２３４−５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
  end
 end
end
  