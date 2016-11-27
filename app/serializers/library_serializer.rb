class LibrarySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone
end
