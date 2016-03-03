skills_list = ['Ruby', 'Rails', 'CSS', 'JavaScript', 'HTML', 'AJAX', 'Responsive Web Design', 'Version control(Git/GitHub)', 'Database Querying & Design ', 'Test Driven Development', 'Agile Methodologies']

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

3.times do
  Owner.create!(first_name: "Polly", last_name: "Trule", uid: "polly@email.com", provider: "codetribute", password: '123456', avatar: File.new("#{Rails.root}/app/assets/images/IMG_6601.jpg"), location: "New York, New York", description: 'Proprietor, dreamer, foodie.')
end

ki_pic = File.new("#{Rails.root}/app/assets/images/13250073.jpg")
kerry = Owner.create!(first_name: 'Kerry', last_name: "Imai", uid: "kccom", avatar: ki_pic, password: "111111", provider: 'codetribute')


song = Owner.create!(first_name: 'Song', last_name: 'Sampson', uid: 'songsampson@gmail.com', password: '123456')



kung = Owner.create!(first_name: 'Khun', last_name: 'Kung', uid: 'goong@gmail.com', password: '123456', avatar: File.new("#{Rails.root}/app/assets/images/IMG_6601.jpg"), location: "Chaloem Phrakiat Ratchakan Thi 9 Soi 59 Khwaeng Dok Mai, Khet Prawet Krung Thep Maha Nakhon 10250 Thailand", description: "Lifetime hair enthusiast, born and raised in Bangkok", provider: "codetribute")

salon = Business.create!(name: "Kung Hair & Beauty", description: "Family salon specializing in women's hair, nails and styling.", location: "Chaloem Phrakiat Ratchakan Thi 9 Soi 59 Khwaeng Dok Mai, Khet Prawet Krung Thep Maha Nakhon 10250 Thailand", owner_id: kerry.id, category_ids: [9])
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon1.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon2.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon3.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/salon4.png") )
salon.photos << Photo.create!( business_id: salon.id, image: File.new("#{Rails.root}/app/assets/images/IMG_6602.jpg") )



mary = Owner.create!(first_name: 'Mary', last_name: 'Joe', uid: 'mary@gmail.com', password: '123456', location: "40 Exchange Place, Exchange Place, New York, NY", description: "Latina mother and proprietor.", provider: "codetribute")

ian = Owner.create!(first_name: 'Ian', last_name: 'Garcia', uid: 'ian@gmail.com', password: '123456', location: "44 New St, New York, NY", description: "Full time barber and proprietor.", provider: "codetribute")

owners = [song, kung, ian, mary]

biz = Business.create!(name: "Cool Cafe", description: "A great cafe to sit with a book, and maybe a friend or two.", location: "11 Bleecker Street, New York", owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz.photos << Photo.create!( business_id: biz.id, image: File.new("#{Rails.root}/app/assets/images/office-table-home-room.jpeg"))

biz1 = Business.create!(name: "Another Cool Cafe", description: "Really, really great coffee. Sunlit and awesome vibe.", location: "32 Broadway", owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz1.photos << Photo.create!( business_id: biz1.id, image: File.new("#{Rails.root}/app/assets/images/space-desk-workspace-coworking.jpg"))

biz2 = Business.create!(name: "Dan's Tailor", description: "Go here to get your clothes made. Seriously. Go.", location: '320 West 18th Street, New York', owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz2.photos << Photo.create!( business_id: biz2.id, image: File.new("#{Rails.root}/app/assets/images/people-office-group-team.jpg"))

biz3 = Business.create!(name: "Carlie's Shoes", description: "Beeeaautiful handmade leather work shoes. Beautiful.", location: '38 Wall Street, New York', owner_id: owners.sample.id, category_ids: [cat_list.sample.id])
biz3.photos << Photo.create!( business_id: biz3.id, image: File.new("#{Rails.root}/app/assets/images/light-coffee-pen-working.jpg"))

songs = Business.create!(name: "Song's Hair Studio", description: 'Beauty Salon', location: '4022 S Conway Rd, Orlando, FL', owner_id: owners.sample.id, category_ids: [9])
songs.photos << Photo.create!( business_id: songs.id, image: File.new("#{Rails.root}/app/assets/images/hands-people-woman-working copy 2.jpg"))


yi = Developer.create!(first_name: 'Yi', last_name: 'Lu', uid: 'yilu@gmail.com', password: '123456', provider: "codetribute", location: "New York", description: "Dev Bootcamp Graduate. Awesome web developer.", skill_ids: dev_skill_ids, slack_id: 'yilu1021')



gary_pic = File.new("#{Rails.root}/app/assets/images/gary.jpg")
gary = Developer.create!(first_name: 'Gary', last_name: 'Tso', uid: 'garytso@gmail.com', password: '123456', location: "New York", description: "Dev Bootcamp Graduate, doughtnut lover", provider: "codetribute", skill_ids: dev_skill_ids)

kc_pic = File.new("#{Rails.root}/app/assets/images/kristie.jpg")
kristie = Developer.create!(first_name: "Kristie", last_name: 'Chow', uid: 'kristie@gmail.com', password: '123456', provider: "codetribute", location: "New York", description: "Newly graduated programmer located in Manhattan. I like travel, coding, and discovering new things around the world.",avatar: kc_pic, skill_ids: dev_skill_ids, slack_id: 'kristie1021')
kristie.received_reviews << Review.create!( comment: 'Cool person, punctual and awesome skills.', communication_rating: 5, quality_rating: 4, timeliness_rating: 5, review_type: "Developer", reviewee_id: kristie.id, reviewer_id: kung.id )
kristie.received_reviews << Review.create!( comment: 'I really like the website Kristie made -- clean, professional and easy to use.', communication_rating: 5, quality_rating: 5, timeliness_rating: 4, review_type: "Developer", reviewee_id: kristie.id, reviewer_id: song.id )


dan_pic = File.new("#{Rails.root}/app/assets/images/dan.jpg")
dan = Developer.create!(first_name: 'Dan', last_name: 'Andersen', uid: 'danandersen2@gmail.com', password: '123456', avatar: dan_pic, location: "New York", description: "DBC Grad. Fun lover.", provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'dandersen2')

mira_pic = File.new("#{Rails.root}/app/assets/images/mira.jpg")
mira = Developer.create!(first_name: 'Mira', last_name: 'Scarvalone', uid: 'mirascarvalone@gmail.com', password: '123456', avatar: mira_pic, location: "New York", description: "Dev Bootcamp Graduate. Awesome web developer.", provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'mirascarvalone')

ed = Developer.create!(first_name: 'Edward', last_name: 'Gemson', uid: 'edwardgemson@gmail.com', password: '123456', location: "New York", description: "Dev Bootcamp Graduate. Awesome web developer.", provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'edwardgemson')

scott = Developer.create!(first_name: 'Scott', last_name: 'Chou', uid: 'scottychou@gmail.com', password: '123456', location: "New York", description: "Dev Bootcamp Graduate. Awesome web developer.", provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'scottchou')

kb_pic = File.new("#{Rails.root}/app/assets/images/kb.jpg")
kb = Developer.create!(first_name: 'K.B.', last_name: 'DiAngelo', uid: 'kb-diangleo@gmail.com', password: '123456', avatar: kb_pic, location: "New York", description: "Dev Bootcamp Graduate. Awesome web developer.", provider: "codetribute", skill_ids: dev_skill_ids, slack_id: 'kaybidee')

nums = [3, 4, 5]

devs = Developer.all
devs.each do |dev|
  3.times do
    dev.received_reviews << Review.create!(comment: "Great, polished website. Clean design, quick responses. I love it!", communication_rating: nums.sample, quality_rating: nums.sample, timeliness_rating: nums.sample, review_type: 'Owner', reviewee_id: dev.id, reviewer_id: owners.sample.id)
  end
end


william = Owner.create!(first_name: "Williams", last_name: 'Pinto', uid: 'williamspinto@email.com', password: '123456', provider: "codetribute")
braza_biz = Business.create!(name: 'Brazas Chicken Inc', description: 'Peruvian & other Latin American chicken & ceviche dishes.', location: '4797 S Orange Ave, Orlando, FL', owner_id: william.id, category_ids: [5])
braza_pic = File.new("#{Rails.root}/app/assets/images/peruvian.jpg")
Photo.create!(image: braza_pic, business_id: braza_biz.id)


shoe = Business.create!(name: "Mary's Shine and Repair", description: "Effective and well stocked shoe repair and shine.", location: "40 Exchange Place, Exchange Place, New York, NY", owner_id: mary.id, category_ids: [7,9], status: "Completed", website: "www.devbootcamp.com")
shoe.photos << Photo.create!( business_id: shoe.id, image: File.new("#{Rails.root}/app/assets/images/shoe1.jpg") )
shoe.photos << Photo.create!( business_id: shoe.id, image: File.new("#{Rails.root}/app/assets/images/shoe2.jpg") )
shoe.photos << Photo.create!( business_id: shoe.id, image: File.new("#{Rails.root}/app/assets/images/shoe3.jpg") )


barber = Business.create!(name: "Blue Chip Barber Shop", description: "Family owned barber shop in the Financial District of New York City.", location: "44 New St, New York, NY", owner_id: ian.id, category_ids: [9], status: "Completed", website: "espezua.github.io")
barber.photos << Photo.create!( business_id: barber.id, image: File.new("#{Rails.root}/app/assets/images/barber1.jpg") )
barber.photos << Photo.create!( business_id: barber.id, image: File.new("#{Rails.root}/app/assets/images/barber2.jpg") )

barber.photos << Photo.create!( business_id: barber.id, image: File.new("#{Rails.root}/app/assets/images/barber3.jpg") )



status_update = StatusUpdate.create(description: 'Thanks to the beautiful website you built for my business, I have new 10  customers.', business_id: salon.id, percentage_revenue_increase: '5%')
status_update2 = StatusUpdate.create(description: "In the past few months I've continued to gain more loyal customers and I've hired a new stylist.", business_id: salon.id, percentage_revenue_increase: '10%')

project1 = Match.create!(user: mary, matched_user: kristie, status: "deployed on Hiroku =)", accepted: "true")

project2 = Match.create!(user: ian, matched_user: kristie, status: "Finished and launched!!", accepted: "true")

project3 = Match.create!(user: william, matched_user: kb, status: "Matched!", accepted: "true")