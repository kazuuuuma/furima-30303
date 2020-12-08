require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/furima-intro01.png')
  end

  describe '#new' do
    context '出品がうまくいくとき' do
      it "image,product_name,profile,category_id,condition_id,charge_id,days_to_ship,prefecture_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "product_nameが空だと出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "profileがないと出品できない" do
        @item.profile = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Profile can't be blank")
      end
      it "category_idがないと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空では出品できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "charge_idが空では出品できない" do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "days_to_shipが空では出品できない" do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "prefecture_idが空では出品できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300~¥9,999,999の間以外では出品できない" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
      it "販売価格が半角数字ではない" do
        @item.price = "３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end
      it "ユーザーが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "product_nameが---だと出品できない" do
        @item.product_name = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
      it "profileが---だと出品できない" do
        @item.profile = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
      it "category_idが---だと出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
      it "condition_idが---だと出品できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
      it "charge_idが---だと出品できない" do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
      it "days_to_shipが---だと出品できない" do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
      it "prefecture_idが---だと出品できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end
    end
  end
end