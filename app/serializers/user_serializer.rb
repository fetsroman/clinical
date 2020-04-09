class UserSerializer < ActiveModel::Serializer
  attributes :username, :discount, :country, :phone_number, :count_cart
  has_many :addresses

  def count_cart
    object.cart.cart_count
  end
end
