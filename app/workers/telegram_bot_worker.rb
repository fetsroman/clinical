require 'telegram/bot'

class TelegramBotWorker
  include Sidekiq::Worker

  def perform(items, total_price, currency, order)
    @currency = currency
    @order = order
    @items = items
    @total_price = total_price

    message = "Корисувач: #{@order}
                По адресі #{@order}
                Номер телефону: #{@order}

                В вас купили такі товари:
                @items

                На суму: #{@total_price} #{@currency}"

    Telegram::Bot::Client.run("911783530:AAHM1AsQryiOQHbpAe7yRehMA0plfVMP0Zs") do |bot|
      # TelegramBot.each do |tg_bot|
        bot.api.send_message(chat_id: 440375095, text: message)
      # end
    end
  end
end
