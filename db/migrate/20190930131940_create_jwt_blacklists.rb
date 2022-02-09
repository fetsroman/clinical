class CreateJwtBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :jwt_blacklists do |t|
      t.string :jti
      t.integer :exp # time when token was created, time in seconds format

      t.timestamps
    end
    add_index :jwt_blacklists, :jti
  end
end
