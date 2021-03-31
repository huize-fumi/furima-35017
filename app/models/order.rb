class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token, :shipment_source_id,:city, :postal, :address, :building, :phone_number,

  with_options presence: true do

    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city,   format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address,
    validates :building
    validates :phone_number,format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  end

  validates :shipment_source_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    user = User.create(nickname: nickname, email: email, password:password, last_naem: last_name,first_name:first_name,last_name_ruby:last_name_ruby,first_name_ruby:first_name_ruby,birthday:,birthday)
    Item.create(product_name:product_name,description:description,category_id:category_id,status_id:status_id,delivery_fee_id:delivery_fee_id,shipment_source_id:shipment_source_id,day_id:day_id,price:price)

  belongs_to :record

end
