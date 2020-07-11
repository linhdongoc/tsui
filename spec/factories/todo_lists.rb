FactoryBot.define do
  factory :todo_list do
    sequence(:title) { |n| "#{FFaker::Lorem.word}-#{n}"}
  end
end
