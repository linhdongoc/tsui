require 'rails_helper'

describe 'Auth::RegistrationsController' do
  let!(:user_attributes) { attributes_for(:user) }

  context 'successfully register a new user' do
    it 'should send an email' do
      expect { post '/auth', params: { user: user_attributes } }.to change(PostmanMailer.deliveries, :count).by(1)
    end
  end

  describe 'validations errors' do
    it 'wrong email' do
      user_attributes[:email] = 'wrong email'
      post '/auth', params: { user: user_attributes }
      expect(response.status).to eq 422
    end

    it 'password not confirmed' do
      user_attributes[:password_confirmation] = 'wrong password'
      post '/auth', params: { user: user_attributes }
      expect(response.status).to eq 422
    end
  end

end
