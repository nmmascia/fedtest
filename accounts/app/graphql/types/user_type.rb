module Types
  class UserType < Types::BaseObject
    key fields: 'id'

    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: false
  end
end