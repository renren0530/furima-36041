FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'Zoo1Zoo3' }
    password_confirmation { 'Zoo1Zoo3' }
    last_name { '蓮' }
    first_name { '大曽根' }
    last_name_kana { 'レン' }
    first_name_kana { 'オオソネ' }
    birthday { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
