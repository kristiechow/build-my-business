skills_list = ['Ruby', 'Rails', 'CSS', 'JavaScript', 'HTML', 'AJAX', 'Responsive Web Design', 'Version control(Git/GitHub)', 'SQL, Database Querying, and Schema Design ', 'Test Driven Development', 'Agile Methodologies']

skills_list.each do |skill|
  Skill.create!(name: skill)
end

dev_skills = Skill.all

dev_skill_ids = Skill.pluck(:id)

categories_list = ['Automotive', 'Business Support & Supplies', 'Computers & Electronics', 'Education', 'Food, Dining, & Entertainment', 'Home & Garden', 'Merchants(Retail)', 'Miscellaneous/Other', 'Personal Care & Services', 'Travel & Transportation']


categories_list.each do |cat|
  Category.create!(name: cat)
end

cat_list = Category.all




6.times do
  Owner.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, uid: Faker::Internet.safe_email, provider: "buildmybusiness", password: '123456', avatar: Faker::Avatar.image, location: Faker::Address.city, description: Faker::Lorem.paragraph)
end
owners = Owner.all


6.times do
  biz = Business.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph, location: Faker::Address.street_address, owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
  biz.photos << Photo.create!( business_id: biz.id, image: Faker::Placeholdit.image)
end


yi = Developer.create!(first_name: 'Yi', last_name: 'Lu', uid: 'yilu@gmail.com', password: '123456', provider: "buildmybusiness", location: Faker::Address.city, description: Faker::Lorem.paragraph, skill_ids: dev_skill_ids)




gary_pic = File.new("#{Rails.root}/app/assets/images/gary.jpg")
gary = Developer.create!(first_name: 'Gary', last_name: 'Tso', uid: 'garytso@gmail.com', password: '123456', location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "buildmybusiness", skill_ids: dev_skill_ids)



dan_pic = File.new("#{Rails.root}/app/assets/images/dan.jpg")
dan = Developer.create!(first_name: 'Dan', last_name: 'Andersen', uid: 'danandersen2@gmail.com', password: '123456', avatar: dan_pic, location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "buildmybusiness", skill_ids: dev_skill_ids)



mira_pic = File.new("#{Rails.root}/app/assets/images/mira.jpg")
mira = Developer.create!(first_name: 'Mira', last_name: 'Scarvalone', uid: 'mirascarvalone@gmail.com', password: '123456', avatar: mira_pic, location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "buildmybusiness", skill_ids: dev_skill_ids)


ed = Developer.create!(first_name: 'Edward', last_name: 'Gemson', uid: 'edwardgemson@gmail.com', password: '123456', location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "buildmybusiness", skill_ids: dev_skill_ids)




scott = Developer.create!(first_name: 'Scott', last_name: 'Tso', uid: 'scottychou@gmail.com', password: '123456', location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "buildmybusiness", skill_ids: dev_skill_ids)




kb_pic = File.new("#{Rails.root}/app/assets/images/kb.jpg")
kb = Developer.create!(first_name: 'K.B.', last_name: 'DiAngelo', uid: 'kb-diangleo@gmail.com', password: '123456', avatar: kb_pic, location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "buildmybusiness", skill_ids: dev_skill_ids)

# nums = [3, 4, 5]

devs = Developer.all
devs.each do |dev|
  3.times do
    dev.received_reviews << Review.create!(comment: Faker::Lorem.sentence, communication_rating: nums.sample, quality_rating: nums.sample, timeliness_rating: nums.sample, review_type: 'Owner', reviewee_id: dev.id, reviewer_id: owners.sample.id)
  end
end




william = Owner.create!(first_name: "Williams", last_name: 'Pinto', uid: 'williamspinto@email.com', password: '123456', provider: "buildmybusiness")
braza_biz = Business.create!(name: 'Brazas Chicken Inc', description: 'Peruvian & other Latin American chicken & ceviche dishes.', location: '4797 S Orange Ave, Orlando, FL', owner_id: william.id)
braza_pic = File.new("#{Rails.root}/app/assets/images/peruvian.jpg")
Photo.create!(image: braza_pic, business_id: braza_biz.id)



kerry = Owner.create!(first_name: 'Kerry', last_name: "Imai", uid: "kccom", password: "111111", provider: 'buildmybusiness')
kristie = Owner.create!(first_name: "Kristie", last_name: 'Chou', uid: 'kristie@email.com', password: '123123', provider: "buildmybusiness")
song = Owner.create!(first_name: 'Song', last_name: 'Sampson', uid: 'songsampson@gmail.com', password: '123456')


Business.create!(name: "Song's Hair Studio
", description: 'Beauty Salon', location: '4022 S Conway Rd, Orlando, FL', owner_id: song.id)

Business.create!(name: "Bob's Business", description: "Just a little bit of business with Bob!", location: "48 Wall Street, New York, NY", owner_id: kristie.id)

Business.create!(name: "Kerry's Little Diner", description: "Just a cool diner in the middle of Kerryville.", location: "300 West 19th Street, New York, NY", owner_id: kerry.id)

Business.create!(name: "Kejmukda Restaurant Phuket", description: "Cool Malaysian cuisine in Phuket, Thailand", location: "100/404 หมู่ 5, ต.รัษฏา, อ.เมือง, ภูเก็ต, Phuket 83120, Thailand", owner_id: kristie.id)

