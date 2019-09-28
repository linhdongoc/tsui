FactoryBot.define do
  factory :book do
    title { Faker::Lorem.word }

    user
  end
end
