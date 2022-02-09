class Admin::BannerSerializer < ActiveModel::Serializer
  attributes :id, :image
  has_many :banner_parameters
end
