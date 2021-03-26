class Delivery_fee < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pay
end