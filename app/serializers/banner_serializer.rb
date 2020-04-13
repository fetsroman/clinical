class BannerSerializer < ActiveModel::Serializer
  attributes :image, :item_id, :link

  def item_id
    if !object.banner_parameters.first.nil?
      Option.find_by_article(object.banner_parameters.first.article).item.id
    else
      nil
    end
  end
end
