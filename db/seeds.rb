require 'faker'

5.times do
  TodoList.create(
      title: "TODO - #{FFaker::Lorem.word}"
  )
end

lists = TodoList.all

lists.each do |list|
  5.times do
    list.items.create(
        name: "Item - #{FFaker::Lorem.word}",
        done: [true, false].sample
    )
  end
end

2.times do
  User.create(
      name: FFaker::Name.unique.name,
      email: FFaker::Internet.email,
      password: 'Pa55w0rd!',
      password_confirmation: 'Pa55w0rd!'
  )
end

users = User.all

users.each do |user|
  3.times do
    user.books.create(
        title: FFaker::Book.title
    )
  end
end

Event.create(
    title: 'Beach Cleanup',
    description: "Let's clean up this beach.",
    location: 'Daytona Beach',
    categories: ["sustainability"],
    term_start: Date.today,
    term_end: Date.tomorrow
)

Event.create(
    title: 'Pet Adoption Day',
    description: "Help animals find new homes.",
    location: '132 N Magnolia Street, Orlando, Florida',
    categories: ["animal", "welfare"],
    term_start: Date.today,
    term_end: Date.tomorrow
)

EventUser.create(
    user_id: 1,
    event_id: Event.first.id,
    role: 'organizer'
)

EventUser.create(
    user_id: 2,
    event_id: Event.first.id,
    role: 'attendee'
)

EventUser.create(
    user_id: 3,
    event_id: Event.first.id,
    role: 'attendee'
)

EventUser.create(
    user_id: 3,
    event_id: Event.last.id,
    role: 'organizer'
)

EventUser.create(
    user_id: 2,
    event_id: Event.last.id,
    role: 'attendee'
)

EventUser.create(
    user_id: 1,
    event_id: Event.last.id,
    role: 'attendee'
)
