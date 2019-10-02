class Item < ApplicationRecord
  has_one :category

  translates :title, :article, :description, :optionsList
  mount_uploader :image, ImageUploader
end
