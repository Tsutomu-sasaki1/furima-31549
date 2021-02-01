class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
        t.integer   :category,         null: false
        t.integer   :condition,        null: false
        t.integer   :date_of_shipment, null: false
        t.integer   :prefectures,      null: false
        t.integer   :shipping_charge,  null: false

        t.timestamps
    end
  end
end
