class ContactSerializer < ActiveModel::Serializer
  attributes :id, :email, :message
end
