FactoryBot.define do
  factory :option do
    article { "MyString" }
    price_ru { 1.5 }
    price_uk { 1.5 }
    volume { "MyString" }
    item { nil }
  end
end
