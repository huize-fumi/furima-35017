FactoryBot.define do
  factory :user do
    nickname {"yamada"}
    email {Faker::Internet.free_email}
    password { "123abc" }
    password_confirmation { "123abc"}
    birthday{Faker::Date.in_date_period}
    first_name { "山田" }
    last_name { "太朗" }
    first_name_ruby { "ヤマダ" }
    last_name_ruby { "タロウ" }
  end
end
