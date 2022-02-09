class NotificationMailer < ApplicationMailer
  default to: "fets.roman@gmail.com"

  def purchase_notification(items, total_price, currency, order)
    @currency = currency
    @order = order
    @items = items
    @total_price = total_price

    mail(subject: "Оповещение о покупке товара")
  end
end
