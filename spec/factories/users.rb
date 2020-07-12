FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'Pa55w0rd!123' }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    confirmed_at { Time.current }

    after(:build) { |record| record.password_confirmation = record.password }
  end
end
