FactoryBot.define do
  factory :order_address do
    token {"sdfadfasjdkfk"}
    postal_code {"000-4563"}
    prefecture_id {2} 
    city {"横浜"} 
    block {"青山"}
    building_name {"柳ビル"}
    phone_number {"09011110000"}
  end
end
