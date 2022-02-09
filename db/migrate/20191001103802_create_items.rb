class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description_uk
      t.text :description_ru
      t.integer :category_id, foreign_key: true

      t.timestamps
    end
  end
end
