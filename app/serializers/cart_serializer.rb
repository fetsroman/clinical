class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_price
  has_many :line_items

  def total_price
    line_items.to_a.sum { |line_item| line_item.item.price * line_item.quantity }
  end
end
