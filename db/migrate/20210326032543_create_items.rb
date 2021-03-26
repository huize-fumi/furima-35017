class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :user,               foreign_key:true
      t.string     :nickname,           null: false, default: ""
      t.string     :product_name,       null: false, default: ""
      t.text       :description,        null: false
      t.integer    :categories_id,      null: false
      t.integer    :status_id,          null: false
      t.integer    :delivery_fee_id,    null: false
      t.integer    :shipment_source_id, null: false
      t.integer    :days_id,            null: false
      t.integer    :price,              null: false

    end
  end
end
