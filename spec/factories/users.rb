FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { 'Pa55w0rd!' }
    password_confirmation { 'Pa55w0rd!' }
  end
end
