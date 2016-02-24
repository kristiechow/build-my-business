FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.street_address }
  end
end
