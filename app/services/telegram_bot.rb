require 'telegram/bot'

token = ENV['TELEGRAM_BOT_API_TOKEN']

Telegram::Bot::Client.run("911783530:AAHM1AsQryiOQHbpAe7yRehMA0plfVMP0Zs") do |bot|
  bot.listen do |message|
    case message.text
    when 'e'
      bot.api.send_message(chat_id: 440375095, text: "Hello")
    when '/start'
      bot.api.send_message(chat_id: 440375095, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: 440375095, text: "Bye, #{message.from.first_name}")
    end
  end
end