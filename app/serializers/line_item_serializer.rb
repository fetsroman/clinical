class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :title, :volume, :price, :image

  def title
    object.item.title
  end

  def volume
    Option.find_by_article(object.article).volume
  end

  def price
    object.price(current_user)
  end

  def image
    object.item.image
  end
end
