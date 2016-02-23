FactoryGirl.define do
  factory :user do
    uid { Faker::Internet.email }
    first_name { Faker::Name.name }
    last_name "name"
    password "password"
  end
end
