require 'telegram/bot'

token = ENV['TELEGRAM_BOT_API_TOKEN']

Telegram::Bot::Client.run("911783530:AAHM1AsQryiOQHbpAe7yRehMA0plfVMP0Zs") do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Тут будуть сповіщення про товари")
      TelegramBot.create!(chat_id: message.chat.id)
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "BB, #{message.from.first_name}")
      TelegramBot.find_by_chat_id(message.chat.id).delete
    end
  end
end