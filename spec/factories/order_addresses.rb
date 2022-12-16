FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    region_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '' }
    phone_num {'07011223344'}
    token {"tok_abcdefghijk00000000000000000"}
  end
  
end
