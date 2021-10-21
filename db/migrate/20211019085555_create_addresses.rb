class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :area_id  ,null: false
      t.string :postcode  ,null: false
      t.string :municipalities  ,null: false
      t.string :address  ,null: false
      t.string :building_name  
      t.string :telephone_number  ,null: false
      t.references :purchase_history,  foreign_key: true, null: false
      t.timestamps
    end
  end
end
