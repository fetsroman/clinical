FactoryBot.define do
  factory :item do
    title { Faker::Lorem.word }
    description_uk { Faker::Lorem.sentence(word_count: 3) }
    description_ru { Faker::Lorem.sentence(word_count: 3) }
    image { Pathname.new(Rails.root.join("public/uploads/item/image/1/Dashboard.png")).open }

    category

    trait :with_options do
      after(:create) do |item|
        create(:option, item: item, article: "some article")
      end
    end
  end
end
