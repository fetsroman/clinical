class CartSerializer < ActiveModel::Serializer
  attributes :total_price, :count_cart
  has_many :line_items do
    object.line_items.order(:created_at)
  end

  def count_cart
    object.cart_count
  end

  def total_price
    @sum = 0
    object.line_items.each do |line_item|
      banner = BannerParameter.find_by_article(line_item.article)

      if current_user.country == "Україна"
        price = Option.find_by_article(line_item.article).price_uah
      elsif current_user.country == "Россия"
        price = Option.find_by_article(line_item.article).price_rub
      end

      if banner.present?
        discount = banner.discount
      else
        discount = current_user.discount
      end

      @sum = @sum + ((price * (1 - (discount.to_f/100))) * line_item.quantity)
    end

    return @sum.round(2)
  end
end
