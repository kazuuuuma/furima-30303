require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end

  describe '#create' do
    context '購入情報保存がうまくいくとき' do
      it "postalcode, prefecture_id, municipality, address, phonenumberが存在すれば購入情報保存できる" do
        expect(@form).to be_valid
      end
    end

    context '購入情報保存がうまくいかないとき' do
      it "postalcodeが空だと保存できない" do
        @form.postalcode = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postalcode can't be blank")
      end
      it "prefecture_idが空では保存できない" do
        @form.prefecture_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalityが空では保存できない" do
        @form.municipality = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空では保存できない" do
        @form.address = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it "phonenumberが空では保存できない" do
        @form.phonenumber = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it "郵便番号にはハイフンが必要であること" do
        @form.postalcode = '-'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postalcode is invalid")
      end
      it "電話番号にはハイフンは不要で、11桁以内であること" do
        @form.phonenumber = '00000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include( )
      end
    end
  end
end
