class CreateBannerParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :banner_parameters do |t|
      t.string :article
      t.integer :discount
      t.belongs_to :banner, foreign_key: true

      t.timestamps
    end
  end
end
