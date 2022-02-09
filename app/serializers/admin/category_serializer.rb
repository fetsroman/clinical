class Admin::CategorySerializer < ActiveModel::Serializer
  attributes :id, :title_uk, :title_ru, :image
end
