class BannerParameter < ApplicationRecord
  belongs_to :banner

  validates_presence_of :article, :discount
end
