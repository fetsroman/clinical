class NotificationMailer < ApplicationMailer
  default from: 'team@movadex.com'

  def purchase_notification(order)
    # @currency = currency
    @order = order
    # @items = items
    # @total_price = total_price

    mail(to: 'fets.roman@gmail.com', subject: "Оповещение о покупке товара")
  end
end
