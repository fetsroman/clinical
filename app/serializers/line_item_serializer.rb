class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :title, :volume, :price, :image

  def title
    object.item.title
  end

  def volume
    Option.find_by_article(object.article).volume
  end

  def price
    banner = BannerParameter.find_by_article(object.article)

    if current_user.country == "Україна"
      price = Option.find_by_article(object.article).price_uah
    elsif current_user.country == "Россия"
      price = Option.find_by_article(object.article).price_rub
    end

    if banner.present?
      discount = banner.discount
    else
      discount = current_user.discount
    end

    return ((price * (1 - (discount.to_f/100))) * object.quantity)
  end

  def image
    object.item.image
  end
end
