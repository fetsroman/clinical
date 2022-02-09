class Banner < ApplicationRecord
  before_create :can_be_only_one

  has_many :banner_parameters, dependent: :destroy

  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :banner_parameters, reject_if: :all_blank, allow_destroy: true

  private

  def can_be_only_one
    raise "You can create only one row of this table" if Banner.count > 0
  end
end
