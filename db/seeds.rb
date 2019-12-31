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

2.times do
  User.create(
      name: Faker::Name.unique.name,
      email: Faker::Internet.email,
      password: 'Pa55w0rd!',
      password_confirmation: 'Pa55w0rd!'
  )
end

users = User.all

users.each do |user|
  3.times do
    user.books.create(
        title: Faker::Book.title
    )
  end
end
