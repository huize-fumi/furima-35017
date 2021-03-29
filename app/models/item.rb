class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }

  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :categories_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :days_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                    format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }

  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :pay
  belongs_to :period
  belongs_to :prefecture

  validates :image, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end


end
