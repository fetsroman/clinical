class Calculations::DiscountPrice
  def self.call(price, article, current_user, quantity: 1)
    banner = BannerParameter.find_by_article(article)

    discount =  if banner.present?
      banner.discount
    else
      current_user.discount
    end

    ((price * (1 - (discount.to_f/100))) * quantity).round(2)
  end
end