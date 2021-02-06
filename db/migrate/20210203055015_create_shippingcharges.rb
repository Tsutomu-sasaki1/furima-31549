class CreateShippingcharges < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingcharges do |t|

      t.timestamps
    end
  end
end
