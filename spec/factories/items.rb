FactoryBot.define do
  factory :item do
    id                   {Faker::Number.unique.number(1)}
    item_name            {Faker::Commerce.color}
    explanation          {Faker::Lorem.sentence}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    category_id          {Faker::Number.between(from:2, to:10)}
    condition_id         {Faker::Number.between(from:2, to:7)}
    prefectures_id       {Faker::Number.between(from:2, to:47)}
    date_of_shipment_id  {Faker::Number.between(from:2, to:4)}
    shipping_charge_id   {Faker::Number.between(from:2, to:3)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
