module Types
  class QueryType < Types::BaseObject
    field :user, UserType, null: true do
      description "Find user by id"
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end
