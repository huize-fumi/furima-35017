FactoryBot.define do
  factory :item do
    product_name { 'yamada' }
    description { 'yamada' }
    categories_id { 1 }
    status_id { 1 }
    delivery_fee_id { 1 }
    shipment_source_id { 1 }
    days_id { 1 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
