require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品登録" do
    before do
      # user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end
    context "出品登録がうまくいかないとき" do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須であること" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
       
       it "商品の説明が必須であること" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
       end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      
      it "カテゴリーの情報が1のとき" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態についての情報が必須であること" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end

      it "商品の状態についての情報が1のとき" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      
      it "発送元の地域についての情報が必須であること" do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank", "Prefectures is not a number")
      end

      it "発送元の地域についての情報が1のとき" do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end
      
      it "配送料の負担についての情報が必須であること" do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank", "Shipping charge is not a number")
      end

      it "配送料の負担についての情報が1のとき" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      
      it "発送までの日数についての情報が必須であること" do
        @item.date_of_shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment can't be blank", "Date of shipment is not a number")
      end
      
      it "発送までの日数についての情報が1のとき" do
        @item.date_of_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment must be other than 1")
      end

      it "価格についての情報が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it "価格の範囲が、¥300~¥9,999,999の間であること" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "価格の範囲が、¥300~¥9,999,999の間であること" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      
      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = "３３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "販売価格は全角文字では登録できないこと" do
        @item.price = "プライス"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      
      it "販売価格は半角英数混合では登録できないこと" do
        @item.price = "price123"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "販売価格は半角英語だけでは登録できないこと" do
        @item.price = "price"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
    context '出品登録がうまくいくとき' do
      it "商品画像を１枚つける、商品名、説明を入力、配送料、カテゴリー、商品状態、発送元地域、発送までの日数の選択、販売価格を半角英数字で入力。以上を満たせば登録可能" do
        expect(@item).to be_valid
      end
    end
  end
end