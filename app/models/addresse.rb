class Addresse < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 0 }
  end
  belongs_to :history
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
