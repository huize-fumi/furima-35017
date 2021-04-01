class OrderArchive
  include ActiveModel::Model
  attr_accessor :shipment_source_id, :city, :postal, :address, :building, :phone_number, :archive_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  validates :shipment_source_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    archive = Archive.create(user_id: user_id, item_id: item_id)
    Order.create(shipment_source_id: shipment_source_id, city: city, postal: postal, address: address, building: building, phone_number: phone_number, archive_id: archive.id)
  end
end
