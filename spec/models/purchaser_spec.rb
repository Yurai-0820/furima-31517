require 'rails_helper'

RSpec.describe OrderCash, type: :model do
  before do
    sleep 0.02
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_cash, user_id: @user.id , item_id: @item.id)
  end
  describe '注文情報の保存' do
    context '注文情報の保存ができるとき' do
      it 'postal_code とprefecture_id、municipalityと address、building_name, phone_number、token、item_id、user_id が存在すれば登録できる' do
        expect(@order).to be_valid
      end

      it 'building_nameが無くても登録できる' do
           @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '注文情報の保存ができないとき' do
      it '郵便番号が空であるときは保存できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", 'Postal code code Input correctly')
      end
      it '郵便番号にハイフンがないときは保存できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code code Input correctly')
      end
      it '都道府県が空であるときは保存できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空であるときは保存できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空であるときは保存できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空であるときは保存できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number number Input only number')
      end
      it '電話番号にハイフンがあるときは保存できない' do
        @order.phone_number = '090-0000-0000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number number Input only number')
      end
      it '電話番号が12桁以上であるときは保存できない' do
        @order.phone_number = '0900000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number number Input only number')
      end
      it '電話番号に数字以外があるときは保存できない' do
        @order.phone_number = '090abcdefgh'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number number Input only number')
      end
      it 'tokenが空であるときは保存できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
