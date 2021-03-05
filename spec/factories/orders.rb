FactoryBot.define do
  factory :order do
    postal_code     { '123-4567' }
    city            { '横浜区' }
    address         { '青山1-1' }
    phone_number    { 12345678901 }
    building        { 'ビル' }
    prefecture_id   { 1 }
    token           {"tok_5435c85088478825734a833b6e28"}
    user_id          {1}
    item_id          {1}
  end
end
