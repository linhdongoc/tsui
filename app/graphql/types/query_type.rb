module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :items, [Types::ItemType], null: false, description: "Return a list of items in the martian library"
    field :books, [Types::BookType], null: false
    field :todo_lists, [Types::TodoListType], null: false

    def users
      User.all
    end

    def items
      Item.all
    end

    def books
      Book.all
    end

    def todo_lists
      TodoList.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    field :item, Types::ItemType, null: false do
      argument :id, ID, required: true
    end

    field :book, Types::BookType, null: false do
      argument :id, ID, required: true
    end

    field :todo_list, Types::TodoListType, null: false do
      argument :id, ID, required: true

    end

    def user(id:)
      User.find(id)
    end

    def item(id:)
      Item.find(id)
    end

    def book(id:)
      Book.find(id)
    end

    def todo_list(id:)
      TodoList.find(id)
    end
  end
end
