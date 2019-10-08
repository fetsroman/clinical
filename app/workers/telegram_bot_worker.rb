require 'telegram/bot'

class TelegramBotWorker
  include Sidekiq::Worker

  def perform(items, total_price, currency, order)
    @currency = currency
    @order = order
    @items = items
    @total_price = total_price
    
    message = "Корисувач: #{@order.name}
                По адресі #{@order.address}
                Номер телефону: #{@order.phone_number}

                В вас купили такі товари:
                #{@items.each do |item|
                  item.title
                end}

                На суму: #{@total_price} #{@currency}"

    Telegram::Bot::Client.run(ENV['TELEGRAM_BOT_API_TOKEN']) do |bot|
      TelegramBot.each do |tg_bot|
        bot.api.send_message(chat_id: tg_bot.chat_id, text: message)
      end
    end
  end
end
