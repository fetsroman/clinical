class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :discount, :country
  has_many :addresses
end
