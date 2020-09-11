require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order_address)
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@order).to be_valid
    end
    it 'クレジットカード情報が存在しないと登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号情報が存在しないと登録できないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号情報に"-"が存在しないと登録できないこと' do
      @order.postal_code = "0009999"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end
    it '都道府県情報が存在しないと登録できないこと' do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it '市区町村情報が存在しないと登録できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地情報が存在しないと登録できないこと' do
      @order.block = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Block can't be blank")
    end
    it '建物名が存在しなくても登録できること' do
      @order.building_name = nil
      @order.valid?
    end
    it '電話番号情報が存在しないと登録できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号情報に"-"が存在するとと登録できないこと' do
      @order.phone_number = "09000001112"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
