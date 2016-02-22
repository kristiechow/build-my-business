# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skills = ['JavaScript', 'jQuery', 'HTML', 'SQL', 'Ruby', 'AJAX', 'CSS', 'Rails']
dev_skills = skills.each {|skill| Skill.create(name: skill)}



yi = Developer.create!(first_name: 'Yi', last_name: 'Lu', uid: 'yilu@gmail.com', password: '123456')

gary_pic = File.new("#{Rails.root}/app/assets/images/gary.jpg")
gary = Developer.create!(first_name: 'Gary', last_name: 'Tso', uid: 'garytso@gmail.com', password: '123456', )


dan_pic = File.new("#{Rails.root}/app/assets/images/dan.jpg")
dan = Developer.create!(first_name: 'Dan', last_name: 'Andersen', uid: 'danandersen2@gmail.com', password: '123456', avatar: dan_pic)

mira_pic = File.new("#{Rails.root}/app/assets/images/mira.jpg")
mira = Developer.create!(first_name: 'Mira', last_name: 'Scarvalone', uid: 'mirascarvalone@gmail.com', password: '123456', avatar: mira_pic)


ed = Developer.create!(first_name: 'Edward', last_name: 'Gemson', uid: 'edwardgemson@gmail.com', password: '123456')
scott = Developer.create!(first_name: 'Scott', last_name: 'Tso', uid: 'scottychou@gmail.com', password: '123456')

kb_pic = File.new("#{Rails.root}/app/assets/images/kb.jpg")
kb = Developer.create!(first_name: 'K.B.', last_name: 'DiAngelo', uid: 'kb-diangleo@gmail.com', password: '123456', avatar: kb_pic)


william = Owner.create!(first_name: "Williams", last_name: 'Pinto', uid: 'williamspinto@email.com', password: '123456')
braza_biz = Business.create!(name: 'Brazas Chicken Inc', description: 'Peruvian & other Latin American chicken & ceviche dishes.', location: '4797 S Orange Ave, Orlando, FL', owner_id: william.id)
braza_pic = File.new("#{Rails.root}/app/assets/images/peruvian.jpg")
Photo.create!(image: braza_pic, business_id: braza_biz.id)

kriste = Owner.create!(first_name: "Kriste", last_name: 'Chou', uid: 'kriste@email.com', password: '123123', provider: 'facebook')


# 10.times do
#   Owner.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, uid: Faker::Internet.email, password: "123123", provider: "facebook")
# end

Business.create!(name: "Bob's Business", description: "Just a little bit of business with Bob!", location: "48 Wall Street, New York, NY", owner_id: kristie.id)
Business.create!(name: "Kerry's Little Diner", description: "Just a cool diner in the middle of Kerryville.", location: "300 West 19th Street, New York, NY", owner_id: kristie.id)
Business.create!(name: "Kejmukda Restaurant Phuket", description: "Cool Malaysian cuisine in Phuket, Thailand", location: "100/404 หมู่ 5, ต.รัษฏา, อ.เมือง, ภูเก็ต, Phuket 83120, Thailand", owner_id: kristie.id)

