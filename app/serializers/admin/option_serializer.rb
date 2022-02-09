class Admin::OptionSerializer < ActiveModel::Serializer
  attributes :id, :article, :price_uah, :price_rub, :volume
end
