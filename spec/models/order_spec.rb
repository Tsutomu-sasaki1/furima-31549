require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:order)
    end
    context '商品購入がうまくいかないとき' do
      it 'postal_codeは空では登録できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it 'postal_codeはハイフンが必須' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include( "Postal code is invalid")
      end
      it 'postal_codeは7桁が必須' do
        @order.postal_code = '123-456'
        @order.valid?
        expect(@order.errors.full_messages).to include( "Postal code is invalid")
      end
        it 'postal_codeは半角英数字での入力が必須' do
        @order.postal_code = '１２３-４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include( "Postal code is invalid")
      end
      it 'cityは空では登録できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include( "City can't be blank")
      end
      it 'addressは空では登録できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include( "Address can't be blank")
      end
      it 'phone_numberは空では登録できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberにハイフンは不要' do
        @order.phone_number = '111-11111111'
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number is invalid")
      end
      it 'phone_numberは11桁の入力が必須' do
        @order.phone_number = 11111
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number is invalid")
      end
      it 'phone_numberは半角英数字の入力が必須' do
        @order.phone_number = '１１１１１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number is invalid")
      end
      it 'prefecture_idの選択が0では登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include( "Prefecture must be other than 0")
      end
      it 'tokenが必須' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include( "Token can't be blank")
      end
      context '商品購入がうまくとき' do
        it 'postal_code,city,address,phone_number,building,prefecture_id,のフォーム入力をしtokenの値を取得すると購入出来る' do 
          expect(@order).to be_valid
        end
      end
    end
  end
end
