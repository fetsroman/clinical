# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Category.create(title_uk: Faker::Lorem.word, title_ru: Faker::Lorem.word, image: Faker::LoremPixel.image)
end

50.times do
  Item.create(
      title: Faker::Lorem.word,
      description_uk: Faker::Lorem.sentence(word_count: 3),
      description_ru: Faker::Lorem.sentence(word_count: 3),
      category_id: rand(1..5),
      image: Faker::LoremPixel.image
  )
end

10.times do
  Option.create(
            article: Faker::Number.number(digits: 3).to_s,
            price_rub: Faker::Number.number(digits: 3),
            price_uah: Faker::Number.number(digits: 3),
            volume: Faker::Lorem.word,
            item_id: rand(1..50)
  )
end