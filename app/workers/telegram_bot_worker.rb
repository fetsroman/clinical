require 'telegram/bot'

class TelegramBotWorker
  include Sidekiq::Worker

  def perform(msg)
    Telegram::Bot::Client.run(ENV['TELEGRAM_BOT_API_TOKEN']) do |bot|
      bot.api.send_message(chat_id: 440375095, text: msg)
    end
  end
end
