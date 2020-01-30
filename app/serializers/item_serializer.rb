class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :options
  # has_one :category
  has_many :options, -> { order(:article) }
  def description
    if current_user.country == "Україна"
      self.object.description_uk
    elsif current_user.country == "Россия"
      self.object.description_ru
    end
  end
end
