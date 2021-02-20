class Addresse < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
    validates :prefecture_id
  end
  validates :prefecture_id, numericality: { other_than: 0 }
  belongs_to :history
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
