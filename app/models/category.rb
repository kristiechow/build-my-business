class Category < ActiveRecord::Base
  has_many :category_businesses
  has_many :businesses, through: :category_businesses
end
