kristie = Owner.create!(first_name: "Kristie", last_name: 'Chow', uid: 'kristie@email.com', password: '123123', provider: 'facebook')
10.times do
  Developer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, uid: Faker::Internet.email, password: "123123", provider: "facebook")
end

10.times do
  Owner.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, uid: Faker::Internet.email, password: "123123", provider: "facebook")
end

Business.create!(name: "Bob's Business", description: "Just a little bit of business with Bob!", location: "48 Wall Street, New York, NY", owner_id: kristie.id)
Business.create!(name: "Kerry's Little Diner", description: "Just a cool diner in the middle of Kerryville.", location: "300 West 19th Street, New York, NY", owner_id: kristie.id)
Business.create!(name: "Kejmukda Restaurant Phuket", description: "Cool Malaysian cuisine in Phuket, Thailand", location: "100/404 หมู่ 5, ต.รัษฏา, อ.เมือง, ภูเก็ต, Phuket 83120, Thailand", owner_id: kristie.id)

skills = ['JavaScript', 'jQuery', 'HTML5', 'SQL', 'Ruby', 'Python', 'AJAX', 'CSS3', 'Rails']
skills.each {|skill| Skill.create(name: skill)}
