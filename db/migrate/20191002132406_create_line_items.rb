class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.belongs_to :cart, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.string :article

      t.timestamps
    end
  end
end
