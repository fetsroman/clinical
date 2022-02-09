class CartSerializer < ActiveModel::Serializer
  attributes :total_price, :count_cart
  has_many :line_items do
    object.line_items.order(:created_at)
  end

  def count_cart
    object.cart_count
  end

  def total_price
    object.total_price(current_user)
  end
end
