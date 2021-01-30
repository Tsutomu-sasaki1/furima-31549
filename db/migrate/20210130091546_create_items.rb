class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string  :item_name,           null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :prefectures_id,      null: false
      t.integer :date_of_shipment_id, null: false
      t.integer :price,               null: false
      t.integer :shipping_charge_id,  null: false
      t.text    :explanation,         null: false

      t.timestamps
    end
  end
end
