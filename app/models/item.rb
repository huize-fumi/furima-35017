class Item < ApplicationRecord

  with_options presence: true do
    validates :product_name
    validates :description
    validates :categories_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :days_id
    validates :price
  end

  validates :user,foreign_key: true

  belongs_to :user

end
