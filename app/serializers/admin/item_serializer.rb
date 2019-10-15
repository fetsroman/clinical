class Admin::ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description_ru, :description_uk, :image
  has_many :options
end
