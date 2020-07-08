# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UsersEvent.destroy_all
Event.destroy_all
User.destroy_all

10.times do |index|
  user = User.create!(username: Faker::Name.name, email: Faker::Internet.email)
  Event.create!(user_id: user.id, location: Faker::Address.full_address, event_date: Time.now - (5 - index).week, description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) )
end






