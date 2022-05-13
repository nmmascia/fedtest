module Types
  User = Struct.new(:id, :name)
  
  class QueryType < Types::BaseObject
    field :user, UserType, null: true do
      description "Find user by id"
      argument :id, ID, required: true
    end

    def user(id:)
      user = User.new(id, "Nick")
      user
    end
  end
end
