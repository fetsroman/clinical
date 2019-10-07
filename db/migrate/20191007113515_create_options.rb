class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :article
      t.float :price_rub
      t.float :price_uah
      t.string :volume
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
