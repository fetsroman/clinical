class Option < ApplicationRecord
  belongs_to :item

  validates_uniqueness_of :article
  validates_presence_of :article, :volume, :price_rub, :price_uah
end
