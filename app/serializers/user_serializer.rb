class UserSerializer < ActiveModel::Serializer
  attributes :username, :discount, :country
  has_many :addresses
end
