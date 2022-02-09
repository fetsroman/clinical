class Admin::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :country, :discount
  has_many :addresses
end
