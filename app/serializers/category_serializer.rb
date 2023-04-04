class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :image

  def title
    eval("self.object.title_#{current_user.country_iso}")
  end
end