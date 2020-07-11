FactoryBot.define do
  factory :user do
    name { FFaker::Name.unique.name }
    email { FFaker::Internet.email }
    password { 'Pa55w0rd!' }
    password_confirmation { 'Pa55w0rd!' }
  end
end
