FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Lorem.word }
    password_digest { Faker::Internet.password }
    discount { Faker::Number.number(digits: 2) }
    country { "Україна" }
  end
end
