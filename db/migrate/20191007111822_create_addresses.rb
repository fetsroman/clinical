class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
    end
  end
end
