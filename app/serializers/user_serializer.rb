class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :discount, :country, :address_id

  # def address
  #   address = User.new(object)
  #   return address
  # end
  #
  # def password
  #   self.password_digest.encrypt
  # end
end
