class Item < ApplicationRecord
  include PgSearch::Model

  belongs_to :category, optional: true
  has_many :options
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  mount_uploader :image, ImageUploader

  pg_search_scope :search, associated_against: { translations:  [:title, :article] }
end
