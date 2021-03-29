class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :days_id
    validates :image
  end

  validates :categories_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_fee_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipment_source_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 },
                    format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }

  belongs_to :user
  has_one_attached :image
end
