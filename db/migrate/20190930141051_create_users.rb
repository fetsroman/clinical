class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :discount
      t.integer :country
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
