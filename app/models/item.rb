class Item < ApplicationRecord
  include PgSearch::Model

  belongs_to :category, optional: true
  has_many :options
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title, :description_ru, :description_uk

  mount_uploader :image, ImageUploader

  scope :by_category, -> category { where(category: category) }

  pg_search_scope :search, against: [:title],
                  using: {
                      tsearch: {
                          any_word: true }
                  },
                  associated_against: { options:  [:article] }
end
