class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :cart
  has_one :item
end
