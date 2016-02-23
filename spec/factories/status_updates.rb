FactoryGirl.define do
  factory :status_update do
    description { Faker::Lorem.paragraph }
    percentage_revenue_increase { Faker::Commerce.price }
    business_id 1
  end
end
