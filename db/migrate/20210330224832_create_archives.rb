class CreateArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :archives do |t|
      t.references :user,            foreign_key:true
      t.references :item,            foreign_key:true
      t.timestamps
    end
  end
end
