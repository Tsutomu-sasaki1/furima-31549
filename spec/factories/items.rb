FactoryBot.define do
  factory :item do
    item_name            {"ええええええええ"}
    explanation          {"アイウエオかきくけこ"}
    price                {"111111"}
    category_id          {2}
    condition_id         {2}
    prefectures_id       {2}
    date_of_shipment_id  {2}
    shipping_charge_id   {2}

    user_id = 1   #userとのアソシエーション

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
