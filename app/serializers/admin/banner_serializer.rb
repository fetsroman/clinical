class Admin::BannerSerializer < ActiveModel::Serializer
  attributes :id, :image, :link
  has_many :banner_parameters
end
