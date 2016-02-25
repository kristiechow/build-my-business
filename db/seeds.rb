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

cat_list_ids = Category.pluck(:id)

6.times do
  Owner.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, uid: Faker::Internet.safe_email, provider: "codetribute", password: '123456', avatar: Faker::Avatar.image, location: Faker::Address.city, description: Faker::Lorem.paragraph)
end
owners = Owner.all

kerry = Owner.create!(first_name: 'Kerry', last_name: "Imai", uid: "kccom", password: "111111", provider: 'codetribute')
kristie = Owner.create!(first_name: "Kristie", last_name: 'Chow', uid: 'kristie@gmail.com', password: '123456', provider: "codetribute")
song = Owner.create!(first_name: 'Song', last_name: 'Sampson', uid: 'songsampson@gmail.com', password: '123456')


kung = Owner.create!(first_name: 'Khun', last_name: 'Kung', uid: 'goong@gmail.com', password: '123456', avatar: File.new("#{Rails.root}/app/assets/images/IMG_6601.jpg"), location: "Chaloem Phrakiat Ratchakan Thi 9 Soi 59 Khwaeng Dok Mai, Khet Prawet Krung Thep Maha Nakhon 10250 Thailand", description: "Lifetime hair enthusiast, born and raised in Bangkok", provider: "codetribute")

salon = Business.create!(name: "Kung Hair & Beauty", description: "Family salon specializing in women's hair, nails and styling.", location: "Chaloem Phrakiat Ratchakan Thi 9 Soi 59 Khwaeng Dok Mai, Khet Prawet Krung Thep Maha Nakhon 10250 Thailand", owner_id: kung.id, category_ids: [9])
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon1.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon2.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon3.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon4.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/IMG_6602.jpg") )

biz = Business.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph, location: Faker::Address.street_address, owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz.photos << Photo.create!( business_id: biz.id, image: File.new("#{Rails.root}/app/assets/images/office-table-home-room.jpeg"))

biz1 = Business.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph, location: Faker::Address.street_address, owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz1.photos << Photo.create!( business_id: biz1.id, image: File.new("#{Rails.root}/app/assets/images/space-desk-workspace-coworking.jpg"))

biz2 = Business.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph, location: Faker::Address.street_address, owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz2.photos << Photo.create!( business_id: biz2.id, image: File.new("#{Rails.root}/app/assets/images/people-office-group-team.jpg"))

biz3 = Business.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph, location: Faker::Address.street_address, owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz3.photos << Photo.create!( business_id: biz3.id, image: File.new("#{Rails.root}/app/assets/images/light-coffee-pen-working.jpg"))

songs = Business.create!(name: "Song's Hair Studio", description: 'Beauty Salon', location: '4022 S Conway Rd, Orlando, FL', owner_id: owners.sample.id, category_ids: [9])
songs.photos << Photo.create!( business_id: songs.id, image: File.new("#{Rails.root}/app/assets/images/hands-people-woman-working copy 2.jpg"))

songser = Business.create!(name: "Song's Dim Sum", description: 'Food and sauces', location: '4012 S Conway Rd, Orlando, FL', owner_id: song.id, category_ids: [9])
songser.photos << Photo.create!( business_id: songser.id, image: File.new("#{Rails.root}/app/assets/images/hands-people-woman-working copy 2.jpg"))

kerrys = Business.create!(name: "Kerry's Little Diner", description: "Just a cool diner in the middle of Kerryville.", location: "300 West 19th Street, New York, NY", owner_id: kerry.id, category_ids: [5])
kerrys.photos << Photo.create!( business_id: kerrys.id, image: File.new("#{Rails.root}/app/assets/images/startup-photos.jpg"))

kejmukda = Business.create!(name: "Kejmukda Restaurant Phuket", description: "Cool Malaysian cuisine in Phuket, Thailand", location: "100/404 หมู่ 5, ต.รัษฏา, อ.เมือง, ภูเก็ต, Phuket 83120, Thailand", owner_id: kerry.id, category_ids: [5])
kejmukda.photos << Photo.create!( business_id: kejmukda.id, image: File.new("#{Rails.root}/app/assets/images/restaurant-people-alcohol-bar.jpg"))


yi = Developer.create!(first_name: 'Yi', last_name: 'Lu', uid: 'yilu@gmail.com', password: '123456', provider: "codetribute", location: Faker::Address.city, description: Faker::Lorem.paragraph, skill_ids: dev_skill_ids, slack_id: 'yilu1021')

gary_pic = File.new("#{Rails.root}/app/assets/images/gary.jpg")
gary = Developer.create!(first_name: 'Gary', last_name: 'Tso', uid: 'garytso@gmail.com', password: '123456', location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "codetribute", skill_ids: dev_skill_ids)

dan_pic = File.new("#{Rails.root}/app/assets/images/dan.jpg")
dan = Developer.create!(first_name: 'Dan', last_name: 'Andersen', uid: 'danandersen2@gmail.com', password: '123456', avatar: dan_pic, location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'dandersen2')

mira_pic = File.new("#{Rails.root}/app/assets/images/mira.jpg")
mira = Developer.create!(first_name: 'Mira', last_name: 'Scarvalone', uid: 'mirascarvalone@gmail.com', password: '123456', avatar: mira_pic, location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'mirascarvalone')

ed = Developer.create!(first_name: 'Edward', last_name: 'Gemson', uid: 'edwardgemson@gmail.com', password: '123456', location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'edwardgemson')

scott = Developer.create!(first_name: 'Scott', last_name: 'Chou', uid: 'scottychou@gmail.com', password: '123456', location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'scottchou')

kb_pic = File.new("#{Rails.root}/app/assets/images/kb.jpg")
kb = Developer.create!(first_name: 'K.B.', last_name: 'DiAngelo', uid: 'kb-diangleo@gmail.com', password: '123456', avatar: kb_pic, location: Faker::Address.city, description: Faker::Lorem.paragraph, provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'kaybidee')

nums = [3, 4, 5]

devs = Developer.all
devs.each do |dev|
  3.times do
    dev.received_reviews << Review.create!(comment: Faker::Lorem.sentence, communication_rating: nums.sample, quality_rating: nums.sample, timeliness_rating: nums.sample, review_type: 'Owner', reviewee_id: dev.id, reviewer_id: owners.sample.id)
  end
end


william = Owner.create!(first_name: "Williams", last_name: 'Pinto', uid: 'williamspinto@email.com', password: '123456', provider: "codetribute")
braza_biz = Business.create!(name: 'Brazas Chicken Inc', description: 'Peruvian & other Latin American chicken & ceviche dishes.', location: '4797 S Orange Ave, Orlando, FL', owner_id: william.id, category_ids: [5])
braza_pic = File.new("#{Rails.root}/app/assets/images/peruvian.jpg")
Photo.create!(image: braza_pic, business_id: braza_biz.id)

mary = Owner.create!(first_name: 'Mary', last_name: 'Joe', uid: 'mary@gmail.com', password: '123456', location: "40 Exchange Place, Exchange Place, New York, NY", description: "Latina mother and proprietor.", provider: "codetribute")

shoe = Business.create!(name: "Mary's Shine and Repair", description: "Effective and well stocked shoe repair and shine.", location: "40 Exchange Place, Exchange Place, New York, NY", owner_id: mary.id, category_ids: [7,9])
shoe.photos << Photo.create!( business_id: shoe.id, image: File.new("#{Rails.root}/app/assets/images/shoe1.jpg") )
shoe.photos << Photo.create!( business_id: shoe.id, image: File.new("#{Rails.root}/app/assets/images/shoe2.jpg") )
shoe.photos << Photo.create!( business_id: shoe.id, image: File.new("#{Rails.root}/app/assets/images/shoe3.jpg") )

ian = Owner.create!(first_name: 'Ian', last_name: 'Garcia', uid: 'ian@gmail.com', password: '123456', location: "44 New St, New York, NY", description: "Full time barber and proprietor.", provider: "codetribute")

barber = Business.create!(name: "Blue Chip Barber Shop", description: "Family owned barber shop in the Financial District of New York City.", location: "44 New St, New York, NY", owner_id: ian.id, category_ids: [9])
barber.photos << Photo.create!( business_id: barber.id, image: File.new("#{Rails.root}/app/assets/images/barber1.jpg") )
barber.photos << Photo.create!( business_id: barber.id, image: File.new("#{Rails.root}/app/assets/images/barber2.jpg") )

barber.photos << Photo.create!( business_id: barber.id, image: File.new("#{Rails.root}/app/assets/images/barber3.jpg") )