# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  m = Member.new
  m.name = Faker::Name.first_name + ' ' + Faker::Name.last_name
  m.username = Faker::Internet.username
  m.email = Faker::Internet.email
  m.password = 'bosspass'
  m.save
end

10.times do
  post = Post.new
  post.title = Faker::Book.title
  post.body = Faker::Lorem.paragraph(sentence_count: [3, 4, 5, 6].sample, supplemental: true, random_sentences_to_add: 4)
  post.author = Member.all.sample
  post.save
end

127.times do
  c = Comment.new
  c.post = Post.all.sample
  c.member = Member.all.sample
  c.text = Faker::Lorem.paragraph(sentence_count: [3, 4, 5, 6].sample, supplemental: true, random_sentences_to_add: 4)
  c.save
end
