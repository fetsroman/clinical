require 'telegram/bot'

Telegram::Bot::Client.run("") do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Na")

      file = File.read("db.txt")
      s = file.split("\n")

      if s.size == 0
        s = s.push(message.chat.id).join("\n").to_s
      else
        s.each do |id|
          if id != message.chat.id
            s = s.push(message.chat.id).join("\n").to_s
          end
        end
      end
      File.write("db.txt", s)

    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "BB, #{message.from.first_name}")

      file = File.read("db.txt")
      s = file.split("\n")
      s.each do |id|
        if id == message.chat.id
          s = s.delete(message.chat.id).join("\n").to_s
        end
      end
      File.write("db.txt", s)
    end
  end
end