FactoryBot.define do
  factory :line_item do
    article { "some article" }
    quantity { Faker::Number.number(digits: 1) }

    cart
    item
  end
end
