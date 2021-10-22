require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep(1)
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
      it '電話番号が12桁以上では購入できない' do
        @purchase_address.telephone_number = '０８０−１２３４−５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が９桁以下では購入できない' do
        @purchase_address.telephone_number = '０８０−１２３４−５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
  end
 end
end
  