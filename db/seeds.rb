# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(
#     name: "company",
#     username: "example",
#     password: "password",
#     discount: 10,
#     country: "Україна"
# )
#
# User.create(
#     name: "company",
#     username: "example2",
#     password: "password",
#     discount: 0,
#     country: "Россия"
# )
#
# Cart.create(user_id: 1)
# Cart.create(user_id: 2)
#
# 3.times do
#   Address.create(
#              title: Faker::Address.street_address,
#              user_id: 1
#   )
# end
#
# Admin.create(
#          username: "admin",
#          password: "password"
# )
#
# 5.times do
#   Category.create(
#       title_uk: Faker::Lorem.word,
#       title_ru: Faker::Lorem.word,
#       image: Pathname.new(Rails.root.join("public/uploads/item/image/1/Dashboard.png")).open
#   )
# end
#
# 50.times do
#   Item.create(
#       title: Faker::Lorem.word,
#       description_uk: Faker::Lorem.sentence(word_count: 3),
#       description_ru: Faker::Lorem.sentence(word_count: 3),
#       category_id: rand(1..5),
#       image: Pathname.new(Rails.root.join("public/uploads/item/image/1/Dashboard.png")).open
#   )
# end
#
# 10.times do
#   Option.create(
#             article: Faker::Number.number(digits: 3).to_s,
#             price_rub: Faker::Number.number(digits: 3),
#             price_uah: Faker::Number.number(digits: 3),
#             volume: Faker::Lorem.word,
#             item_id: rand(1..50)
#   )
# end
#
# Banner.create(
#     image: Pathname.new(Rails.root.join("public/uploads/item/image/1/Dashboard.png")).open
# )
#
# BannerParameter.create(
#                    article: "102",
#                    discount: 10,
#                    banner_id: Banner.first.id
# )
#
# 3.times do
#   article = ["102", "365", "149"].sample
#   LineItem.create(
#               item_id: rand(1..50),
#               cart_id: 1,
#               quantity: rand(1..10),
#               article: article
#   )
# end