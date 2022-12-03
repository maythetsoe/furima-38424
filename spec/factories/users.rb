FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"健太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"ケンタロウ"}
    birthday              {"1930-02-02"}
  end
end