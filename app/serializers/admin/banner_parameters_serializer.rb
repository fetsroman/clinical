class Admin::BannerParametersSerializer < ActiveModel::Serializer
  attributes :id, :article, :discount
end
