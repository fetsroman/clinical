class User < ApplicationRecord
  has_secure_password

  has_many :addresses, dependent: :destroy
  has_one :cart, dependent: :destroy
  validates_presence_of :name, :username, :discount,:country
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  enum country: [:"Россия", :"Україна"]

  def russia?
    self.country == "Россия"
  end

  def ukraine?
    self.country == "Україна"
  end

  def currency
    return "uah" if ukraine?
    return "rub" if russia?
  end

  def country_iso
    return "uk" if ukraine?
    return "rus" if russia?
  end
end
