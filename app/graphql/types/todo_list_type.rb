module Types
  class TodoListType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :items, [Types::ItemType], null: true
    field :items_count, Integer, null: true

    def items_count
      object.items.size
    end
  end
end
