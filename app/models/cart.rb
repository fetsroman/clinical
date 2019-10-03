class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_item(item)
    current_item = line_items.find_by(item_id: item.id)
    if !current_item
      current_item = line_items.create!(item_id: item.id)
      self.total_price
    else
      current_item.update!(quantity: (current_item.quantity + item.quantity))
      self.total_price
    end
    current_item
  end

  def total_price
    total_price = line_items.to_a.sum { |line_item| line_item.item.price * line_item.quantity }
    self.update!(total_price: total_price)
  end
end
