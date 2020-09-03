require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end
    it '全ての項目が存在すれば登録できること' do
      @item.valid?
      expect(@item).to be_valid
    end
    it '商品名が存在すれば登録できること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が存在すれば登録できること' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーが存在すれば登録できること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が存在すれば登録できること' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担が存在すれば登録できること' do
      @item.delivery_change_burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery change burden can't be blank")
    end
    it '発送元の地域が存在すれば登録できること' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数が存在すれば登録できること' do
      @item.days_up_to_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days up to delivery can't be blank")
    end
    it '価格情報が存在すれば登録できること' do
      @item.price_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥300以上であれば登録できること' do
      @item.price_id = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格が¥9,999,999以下であれば登録できること' do
      @item.price_id = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '販売価格は半角数字のみであれば登録できること' do
      @item.price_id = "asdffas"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
