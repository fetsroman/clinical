class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :image

  def title
    if current_user.country == "Україна"
      self.object.title_uk
    elsif current_user.country == "Россия"
      self.object.title_ru
    end
  end
end
