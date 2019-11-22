class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates_presence_of :article, :quantity

  def price(current_user)
    banner = BannerParameter.find_by_article(self.article)

    if current_user.country == "Україна"
      price = Option.find_by_article(self.article).price_uah
    elsif current_user.country == "Россия"
      price = Option.find_by_article(self.article).price_rub
    end

    if banner.present?
      discount = banner.discount
    else
      discount = current_user.discount
    end

    return ((price * (1 - (discount.to_f/100))) * self.quantity)
  end
end
