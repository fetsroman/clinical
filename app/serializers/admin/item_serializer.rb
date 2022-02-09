class Admin::ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description_ru, :description_uk, :image, :category
  has_many :options
  has_one :category
end
