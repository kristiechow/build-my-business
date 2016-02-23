class Category < ActiveRecord::Base
  has_and_belongs_to_many :businesses
  # has_many :business_categories

  # has_many :businesses, through: :business_categories
end
