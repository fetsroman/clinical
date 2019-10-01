class User < ApplicationRecord
  has_secure_password

  belongs_to :address
  enum country: [:russia, :ukraine]


  def address
    Address.find_by_id(self.address_id).address
  end

  # before_save do
  #   self.password = (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle.first(8).join
  # end
end
