class CreateRefreshTokenWhitelists < ActiveRecord::Migration[5.2]
  def change
    create_table :refresh_token_whitelists do |t|
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end
