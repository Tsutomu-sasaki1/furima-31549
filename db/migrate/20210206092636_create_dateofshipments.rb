class CreateDateofshipments < ActiveRecord::Migration[6.0]
  def change
    create_table :dateofshipments do |t|

      t.timestamps
    end
  end
end
