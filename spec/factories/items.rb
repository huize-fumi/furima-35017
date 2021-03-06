FactoryBot.define do
  factory :item do
    product_name { 'yamada' }
    description { 'yamada' }
    category_id { 1 }
    status_id { 1 }
    delivery_fee_id { 1 }
    shipment_source_id { 1 }
    day_id { 1 }
    price { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
