class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :phone_number, :prefecture_id, :building, :token, :item_id, :user_id, :history_id

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
  end
    validates :token, presence: { message: "Token can't be blank" }

  def save
    history = Historie.create(user_id: user_id, item_id: item_id)
    Addresse.create!(postal_code: postal_code, city: city, address: address, phone_number: phone_number, prefecture_id: prefecture_id,building: building, history_id: history.id)
                                                         
  end
end