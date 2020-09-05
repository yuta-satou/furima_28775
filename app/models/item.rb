class Item < ApplicationRecord
  class Item < ApplicationRecord
    belongs_to :user
    extend ActiveHash::Associations::ActiveRecordExtensions 
    belongs_to_active_hash :category 
    belongs_to_active_hash :status
    belongs_to_active_hash :delivery_change_burden
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :days_up_to_delivery
  end
  PRICE_REGEX = /\A[0-9]+\z/
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :delivery_change_burden_id
      validates :prefecture_id
      validates :days_up_to_delivery_id 
    end
    validates :price_id, numericality: { only_interger: true }, numericality: { greater_than_or_equal_to: 300 },
    numericality: { less_than_or_equal_to: 9999999 },format: { with: PRICE_REGEX }
  end
  
end
