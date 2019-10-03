class Item < ApplicationRecord
  include PgSearch::Model

  belongs_to :category
  has_many :line_items, dependent: :destroy

  translates :title, :article, :description, :optionsList
  mount_uploader :image, ImageUploader

  pg_search_scope :search, associated_against: { translations:  [:title, :article] }
end
