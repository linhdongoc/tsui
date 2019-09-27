require 'faker'


20.times do
  TodoList.create(
      title: Faker::Lorem.word
  )
end

lists = TodoList.all

lists.each do |list|
  5.times do
    list.items.create(
        name: Faker::Lorem.word,
        done: [true, false].sample
    )
  end
end
