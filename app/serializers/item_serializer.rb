class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :article, :description, :image, :measure, :optionsList
  has_one :category

  def optionsList
    return JSON(self.object.optionsList)
  end
end
