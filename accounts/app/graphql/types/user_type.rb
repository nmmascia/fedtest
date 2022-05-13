module Types
  class UserType < Types::BaseObject
    key fields: 'id'

    field :id, ID, null: false
    field :name, String, null: true

    def self.resolve_reference(object, _context)
      puts object[:id]
    end
  end
end