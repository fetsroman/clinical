class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def total_price(current_user)
    @sum = 0
    line_items.each do |line_item|
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

    return @sum
  end

  def delete_item
    self.line_items.destroy_all
  end

  def cart_count
    count = 0
    self.line_items.each do |lt|
      count += (lt.quantity)
    end
    count
  end
end
