require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'items' do
    let!(:items) { create_pair(:item) }
    let(:query) do
      %(query { items {name done} })
    end

    subject(:result) do
      TsuiSchema.execute(query).as_json
    end

    it 'returns all items' do
      expect(result.dig('data', 'items')).to match_array( items.map{|item| {'name' => item.name, 'done' => item.done } })
    end
  end

  describe 'user' do
    let!(:users) { create_pair(:user) }
    let(:query) do
      %(query { users {name email} })
    end

    subject(:result) do
      TsuiSchema.execute(query).as_json
    end

    it 'returns all users' do
      expect(result.dig('data', 'users')).to match_array( users.map{|user| {'name' => user.name, 'email' => user.email} })
    end
  end

  describe 'book' do
    let!(:books) { create_pair(:book) }
    let(:query) do
      %(query { books {title} })
    end

    subject(:result) do
      TsuiSchema.execute(query).as_json
    end

    it 'returns all books' do
      expect(result.dig('data', 'books')).to match_array( books.map{|book| {'title' => book.title} })
    end
  end

  describe 'todo_list' do
    let!(:todo_lists) { create_pair(:todo_list) }
    let(:query) do
      %(query { todoLists {title} })
    end

    subject(:result) do
      TsuiSchema.execute(query).as_json
    end

    it 'returns all todoLists' do
      expect(result.dig('data', 'todoLists')).to match_array( todo_lists.map{|todo_list| {'title' => todo_list.title} })
    end
  end
end
