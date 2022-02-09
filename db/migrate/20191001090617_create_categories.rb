class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title_uk
      t.string :title_ru

      t.timestamps
    end
  end
end
