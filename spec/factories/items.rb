FactoryBot.define do
  factory :item do
    id                   {Faker::Number.unique.number(1)}
    item_name            {Faker::Commerce}
    explanation          {Faker::Lorem}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    category_id          {Faker::Number.number(2..10)}
    condition_id         {Faker::Number.number(2..7)}
    prefectures_id       {Faker::Number.number(2..47)}
    date_of_shipment_id  {Faker::Number.number(2..4)}
    shipping_charge_id   {Faker::Number.number(2..3)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
