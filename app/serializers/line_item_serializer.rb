class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :item
end
