class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates_presence_of :article, :quantity

  def price(current_user)
    price = eval("Option.find_by_article(self.article).price_#{current_user.currency}")
    Calculations::DiscountPrice.call(price, self.article, current_user, quantity: self.quantity)
  end
end
