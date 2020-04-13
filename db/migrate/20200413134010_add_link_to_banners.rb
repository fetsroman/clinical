class AddLinkToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :link, :string
  end
end
