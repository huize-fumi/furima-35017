class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :day_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                    format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }

  belongs_to :user
  has_one_attached :image
  has_one :archive

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :day

  validates :image, presence: true, unless: :was_attached?
  def was_attached?
    image.attached?
  end
end
