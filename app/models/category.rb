class Category < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :items, dependent: :destroy
  validates_presence_of :title_ru, :title_uk
end
