class OrderArchive < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :shipment_source,:city, :postal, :address, :building, :phone_number, :archive, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  validates :shipment_source, numericality: { other_than: 0, message: "can't be blank" }

  def save
    archive = Archive.create(user_id: user_id, item:item)
    Order.create(shipment_source: shipment_source,city: city,postal: postal,address: address,building: building,phone_number: phone_number,archive_id: archive.id)
#    user = User.create(nickname: nickname, email: email, password:password, last_naem: last_name,first_name:first_name,last_name_ruby:last_name_ruby,first_name_ruby:first_name_ruby,birthday:,birthday)
#    Item.create(product_name:product_name,description:description,category_id:category_id,status_id:status_id,delivery_fee_id:delivery_fee_id,shipment_source_id:shipment_source_id,day_id:day_id,price:price)
  end

end
