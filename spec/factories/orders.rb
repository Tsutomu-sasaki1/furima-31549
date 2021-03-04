FactoryBot.define do
  factory :order do
    postal_code     {123-4567}
    city            {''}
    address         {}
    phone_number    {}
    building        {}
    prefectures_id  {}
  end
end
