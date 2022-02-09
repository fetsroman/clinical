class AdminSerializer < ActiveModel::Serializer
  attributes :username, :password_digest
end
