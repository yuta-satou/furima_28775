class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :token, :order_id, :user_id,:item_id
  POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  PHONE_REGEX = /\A\d{10,11}\z/
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: POSTAL_REGEX }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :phone_number, format: {with: PHONE_REGEX }
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, 
      phone_number: phone_number, order_id: order.id)
  end

end