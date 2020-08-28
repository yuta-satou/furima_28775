class Item < ApplicationRecord
  class Item < ApplicationRecord
    belongs_to :user
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    #空の投稿を保存できないようにする
    validates :category, presence: true
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 } 
    belongs_to_active_hash :status
    #空の投稿を保存できないようにする
    validates :status, presence: true
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :status_id, numericality: { other_than: 1 }

    belongs_to_active_hash :delivery_change_burden
    validates :delivery_change_burden, presence: true
    validates :delivery_change_burden_id, numericality: { other_than: 1 } 

    belongs_to_active_hash :prefecture
    validates :prefecture, presence: true
    validates :prefecture_id, numericality: { other_than: 1 } 

    belongs_to_active_hash :days_up_to_delivery
    validates :days_up_to_delivery, presence: true
    validates :days_up_to_delivery_id, numericality: { other_than: 1 } 
  end
  
end
