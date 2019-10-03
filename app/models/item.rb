class Item < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy

  translates :title, :article, :description, :optionsList
  mount_uploader :image, ImageUploader
end
