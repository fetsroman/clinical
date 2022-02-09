FactoryBot.define do
  factory :category do
    title_uk { Faker::Lorem.word }
    title_ru { Faker::Lorem.word }
    image { Pathname.new(Rails.root.join("public/uploads/item/image/1/Dashboard.png")).open }
  end
end
