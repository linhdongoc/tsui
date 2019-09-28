require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a valid factory' do
    expect(build(:book)).to be_valid
  end

  let(:user) { create(:user) }
  let(:attributes) do
    {
        title: 'Harry Potter',
        user: user
    }
  end

  let(:book) { create(:book, **attributes) }

  describe 'model validations' do
    it { expect(book).to allow_value(attributes[:title]).for(:title) }
  end

  describe 'model associations' do
    it { expect(book).to belong_to(:user) }
  end
end
