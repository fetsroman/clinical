FactoryBot.define do
  factory :refresh_token_whitelist do
    token { "MyString" }
    user_id { 1 }
  end
end
