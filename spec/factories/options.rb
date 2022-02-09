FactoryBot.define do
  factory :option do
    article { Faker::Lorem.word }
    price_rub { Faker::Number.number(digits: 3) }
    price_uah { Faker::Number.number(digits: 2) }
    volume { Faker::Lorem.word }

    item
  end
end
