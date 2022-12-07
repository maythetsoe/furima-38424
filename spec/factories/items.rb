FactoryBot.define do
  factory :item do
    name                           { 'sunglasses' }
    description                    { '1年間部屋に眠っていた商品です。' }
    detail_category_id             { 2 }
    detail_commodity_condition_id  { 2 }
    delivery_burden_id             { 2 }
    region_id                      { 2 }
    days_to_ship_id                { 2 }
    price                          { 900 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/dog.jpeg'), filename: 'dog.jpeg')
    end

    association :user
  end
end
