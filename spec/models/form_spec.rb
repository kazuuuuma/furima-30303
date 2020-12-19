require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end

  describe '#create' do
    context '購入情報保存がうまくいくとき' do
      it "postalcode, prefecture_id, municipality, address, phonenumber, tokenが存在すれば購入情報保存できる" do
        expect(@form).to be_valid
      end
      it "建物が空でも保存できる" do
        @form.build = ''
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
        @form.postalcode = '0000000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postalcode is invalid")
      end
      it "電話番号にはハイフンは不要であること" do
        @form.phonenumber = '000-0000-0000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it "電話番号は11桁以内であること" do
        binding.pry
        @form.phonenumber = '000000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it "tokenが空では登録できないこと" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
