FactoryBot.define do
  factory :user do
    username { "MyString" }
    password_digest { "MyString" }
    discount { 1 }
    country { 1 }
    belongs_to { "" }
  end
end
