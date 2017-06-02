10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10,20)
  )
end

users = User.all

10.times do
  Topic.create(
    title: Faker::Lorem.word,
    user: users.sample
  )
end

topics = Topic.all

60.times do
  Bookmark.create(
    url: Faker::Internet.url,
    topic: topics.sample,
    user: users.sample,
    name: Faker::Lorem.word
  )
end
