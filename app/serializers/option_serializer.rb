class OptionSerializer < ActiveModel::Serializer
  attributes :article, :volume, :price, :discounted_price

  def price
    if current_user.country == "Україна"
      self.object.price_uah
    elsif current_user.country == "Россия"
      self.object.price_rub
    end
  end

  def discounted_price
    banner = BannerParameter.find_by_article(object.article)

    if banner.present?
      discount = banner.discount
    else
      discount = current_user.discount
    end

    return (price*(1-(discount.to_f/100)))
  end
end