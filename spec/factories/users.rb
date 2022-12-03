FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    # first_name            {Faker::Name.first_name("山田")}
    # last_name             {Faker::Name.last_name ("健太郎")}
    # first_name_kana       {Faker::Name.first_name_kana ("ヤマダ")}
    # last_name_kana        {Faker::Name.last_name_kana ("ケンタロウ")}
    first_name            {"山田"}
    last_name             {"健太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"ケンタロウ"}
    birthday              {"1930-02-02"}
  end
end