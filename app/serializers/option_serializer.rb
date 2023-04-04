class OptionSerializer < ActiveModel::Serializer
  attributes :article, :volume, :price, :discounted_price

  def price
    eval("self.object.price_#{current_user.currency}")
  end

  def discounted_price
    Calculations::DiscountPrice.call(price, object.article, current_user)
  end
end