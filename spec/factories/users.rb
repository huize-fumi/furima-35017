FactoryBot.define do
  factory :user do
    nickname {:yamada}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday{Faker::Date.in_date_period}
    first_name { :山田 }
    last_name { :太朗 }
    first_name_ruby { :ヤマダ }
    last_name_ruby { :タロウ }
  end
end
