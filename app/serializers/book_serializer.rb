class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :releaseDate
  has_one :author
end
