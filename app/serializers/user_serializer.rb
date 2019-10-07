class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :discount, :country
  has_many :addresses

  def password
    self.object.password_digest.encrypt
  end
end
