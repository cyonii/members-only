# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create users
100.times do
  m = User.new
  m.name = Faker::Name.first_name + ' ' + Faker::Name.last_name
  m.username = Faker::Internet.username
  m.email = Faker::Internet.email
  m.password = 'bosspass'
  m.save
end

# Create forums
20.times do
  forum = Forum.new({
    name: Faker::Movie.title,
    description: Faker::Lorem.sentence(word_count: 10),
    admin: User.all.sample
    })
  forum.save
end

# Add members to forums
2.times do
  User.all.each do |user|
    forum = Forum.all.sample

    unless forum.members.include?(user)
      forum.members << user
    end
  end
end

# Create posts for forums
100.times do
  forum = Forum.all.sample
  post = forum.posts.new
  post.title = Faker::Book.title
  post.body = Faker::Lorem.paragraph(sentence_count: [3, 4, 5, 6].sample, supplemental: true, random_sentences_to_add: 4)
  post.author = forum.members.sample
  post.save
end

# Create comments for posts
300.times do
  forum = Forum.all.sample
  post = forum.posts.sample
  if post
    comment = post.comments.new
    comment.user = forum.members.sample
    comment.text = Faker::Lorem.paragraph(sentence_count: [3, 4, 5, 6].sample, supplemental: true, random_sentences_to_add: 4)
    comment.save
  end
end
