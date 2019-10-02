class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :image

  # def image
  #   self.image.url
  # end
end
