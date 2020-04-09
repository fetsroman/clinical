class Admin::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :country, :discount, :phone_number
  has_many :addresses
end
