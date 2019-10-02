class Category < ApplicationRecord
  translates :title
  mount_uploader :image, ImageUploader

  has_many :items, dependent: :destroy
end
