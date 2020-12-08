FactoryBot.define do
  factory :item do
    product_name    {"あああ"}
    profile         {"aaa"}
    category_id     {"2"}
    condition_id    {"2"}
    prefecture_id   {"2"}
    charge_id       {"2"}
    days_to_ship_id {"2"}
    price           {"30000"}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-intro01.png'), filename: 'furima-intro01.png')
    end
  end
end
