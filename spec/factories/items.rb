FactoryBot.define do
  factory :item do
    product_name { 'yamada' }
    description { 'yamada' }
    categories_id { 0 }
    status_id { '--' }
    delivery_fee_id { '--' }
    shipment_source_id { '--' }
    days_id { '--' }
    price { '1000' }
  end
end
