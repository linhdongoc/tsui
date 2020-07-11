FactoryBot.define do
  factory :book do
    title { FFaker::Lorem.word }

    user
  end
end
