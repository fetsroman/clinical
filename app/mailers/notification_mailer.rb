class NotificationMailer < ApplicationMailer
  default from: 'team@movadex.com',
          to: ENV['EMAIL_TO']

  def purchase_notification(msg)
    @msg = msg
    mail(subject: "Оповещение о покупке товара")
  end
end
