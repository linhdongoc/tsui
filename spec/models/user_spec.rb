require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:book) { create(:book) }
  let(:attributes) do
    {
        name: 'Claudia Müller',
        email: 'claudia_mueller@example.de',
        books: [book]
    }
  end

  let(:user) { create(:user, **attributes) }

  describe 'model validations' do
    it { expect(user).to allow_value(attributes[:name]).for(:name) }
    it { expect(user).to allow_value(attributes[:email]).for(:email) }
  end

  describe 'model associations' do
    it { expect(user).to have_many(:books) }
  end
end
