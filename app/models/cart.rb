class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def total_price(current_user)
    self.line_items.inject(0) do |sum, line_item|
      sum += line_item.price(current_user)
    end.round(2)
  end

  def delete_item
    self.line_items.destroy_all
  end

  def cart_count
    self.line_items.inject(0) do |count, lt|
      count += (lt.quantity)
    end
  end
end
