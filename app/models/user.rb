class User < ApplicationRecord
  has_secure_password

  has_many :addresses, dependent: :destroy
  has_one :cart, dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  enum country: [:"Россия", :"Україна"]
end
