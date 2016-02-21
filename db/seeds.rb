# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
kriste = Owner.create!(first_name: "Kriste", last_name: 'Chou', uid: 'kriste@email.com', password: '123123', provider: 'facebook')
10.times do
  Developer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, uid: Faker::Internet.email, password: "123123", provider: "facebook")
end

10.times do
  Owner.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, uid: Faker::Internet.email, password: "123123", provider: "facebook")
end

Business.create!(name: "Bob's Business", description: "Just a little bit of business with Bob!", location: "48 Wall Street, New York, NY", owner_id: kriste.id)
