FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '翔' }
    first_name_kana { 'カナ' }
    last_name { '大' }
    last_name_kana { 'カナ' }
    birth_day { '2000-01-01' }
  end
end
