Types::TodoListType = GraphQL::ObjectType.define do
  name 'TodoList'
  description 'The Todo List'

  field :id, !types.ID
  field :title, !types.String
end
