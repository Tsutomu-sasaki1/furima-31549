FactoryBot.define do
  factory :item do
    id                   { Faker::Number.unique.number(1) }
    item_name            { 'サンプル商品' }
    explanation          { 'サンプル商品説明' }
    price                { 1000 }
    category_id          { 2 }
    condition_id         { 2 }
    prefecture_id { 2 }
    date_of_shipment_id  { 2 }
    shipping_charge_id   { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
