class Banner < ApplicationRecord
  has_many :banner_parameters, dependent: :destroy

  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :banner_parameters, reject_if: :all_blank, allow_destroy: true
end
