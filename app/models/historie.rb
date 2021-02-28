class Historie < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :item_id
  end
  
   belongs_to :item
   belongs_to :user
   has_one :addresse
end
