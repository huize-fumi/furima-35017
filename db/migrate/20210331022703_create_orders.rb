class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.integer    :shipment_source_id, null: false
      t.string     :city,               null: false, default: ""
      t.string     :postal,             null: false, default: ""
      t.string     :address,            null: false, default: ""
      t.string     :building,           null: false
      t.string     :phone_number,       null: false, default: ""
      t.references :archive,             foreign_key: true      

    end
  end
end
