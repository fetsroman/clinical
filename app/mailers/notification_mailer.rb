class NotificationMailer < ApplicationMailer
  default from: ENV['EMAIL']
          # to: ENV['EMAIL_TO']

  def purchase_notification(msg_params, current_user, currency, mail, items, total_price)
    @msg_params = msg_params
    @current_user = current_user
    @currency = currency
    @items = items
    @total_price = total_price
    mail(subject: "Оповещение о покупке товара", to: mail)
  end
end
