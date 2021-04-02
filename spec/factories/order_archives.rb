FactoryBot.define do
  factory :order_archive do
    shipment_source_id { 1 }
    postal { '123-4567' }
    city { '横浜市' }
    address { '青山111-1' }
    building { 'シャングリラ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
