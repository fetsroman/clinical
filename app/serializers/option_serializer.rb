class OptionSerializer < ActiveModel::Serializer
  attributes :article, :volume, :price

  def price
    if @current_user.country == "Україна"
      self.object.price_uah
    elsif @current_user.country == "Россия"
      self.object.price_rub
    end
  end
end