class BannerSerializer < ActiveModel::Serializer
  attributes :image, :item_id

  def item_id
    Option.find_by_article(object.banner_parameters.first.article).item.id
  end
end
