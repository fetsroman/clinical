class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :options
  # has_one :category
  has_many :options do
    object.options.order(:id)
  end

  def description
    eval("self.object.description_#{current_user.country_iso}")
  end
end
