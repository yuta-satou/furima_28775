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
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true,
            numericality: { other_than: 1 }
  validates :status_id, presence: true,
            numericality: { other_than: 1 }
  validates :delivery_change_burden_id, presence: true,
            numericality: { other_than: 1 } 
  validates :prefecture_id, presence: true,
            numericality: { other_than: 0 }
  validates :days_up_to_delivery_id, presence: true,
            numericality: { other_than: 1 } 
  validates :price_id, presence: true
  validates :price_id, numericality: { only_interger: true }  # 数字のみで構成されているか
  validates :price_id, numericality: { greater_than_or_equal_to: 300 }  # 数字が300以上であるか
  validates :price_id, numericality: { less_than_or_equal_to: 9999999 }     # 数字が999999以下であるか
  validates :price_id, format: { with: PRICE_REGEX }
  
end
