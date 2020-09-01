class Item < ApplicationRecord
  PRICE_REGEX = /\A[0-9]+\z/
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  class Item < ApplicationRecord
    belongs_to :user
    extend ActiveHash::Associations::ActiveRecordExtensions
    
    belongs_to_active_hash :category
    validates :category_id, presence: true
    validates :category_id, numericality: { other_than: 1 } 
    
    belongs_to_active_hash :status
    validates :status_id, presence: true
    validates :status_id, numericality: { other_than: 1 }

    belongs_to_active_hash :delivery_change_burden
    validates :delivery_change_burden_id, presence: true
    validates :delivery_change_burden_id, numericality: { other_than: 1 } 

    belongs_to_active_hash :prefecture
    validates :prefecture_id, presence: true
    validates :prefecture_id, numericality: { other_than: 0 } 

    belongs_to_active_hash :days_up_to_delivery
    validates :days_up_to_delivery_id, presence: true
    validates :days_up_to_delivery_id, numericality: { other_than: 1 } 
  end
  validates :price_id, presence: true
  validates :price_id, numericality: { only_interger: true }  # 数字のみで構成されているか
  validates :price_id, numericality: { greater_than_or_equal_to: 300 }  # 数字が5以上であるか
  validates :price_id, numericality: { less_than_or_equal_to: 9999999 }     # 数字が5以下であるか
  validates :price_id, format: { with: PRICE_REGEX }
  
end
