class Me < ActiveRecord::Migration[6.0]
  def change
    drop_table :shippingcharges
  end
end
