class CreateTelegramBots < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_bots do |t|
      t.integer :chat_id

      t.timestamps
    end
  end
end
