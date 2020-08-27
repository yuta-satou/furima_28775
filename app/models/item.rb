class Item < ApplicationRecord
  class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
  
    #空の投稿を保存できないようにする
    validates :category, presence: true
  
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 } 
  end
  
end
