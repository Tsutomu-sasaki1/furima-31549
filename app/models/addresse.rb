class Addresse < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
    validates :prefecture_id
  end
  belongs_to :history
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
