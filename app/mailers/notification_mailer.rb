class NotificationMailer < ApplicationMailer
  default from: 'team@movadex.com'

  def purchase_notification(msg)
    @msg = msg
    mail(to: 'fets.roman@gmail.com', subject: "Оповещение о покупке товара")
  end
end
