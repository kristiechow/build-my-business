class Business < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :status_updates
  has_many :photos
  has_many :business_categories
  has_many :categories, through: :business_categories

  geocoded_by :location
  after_validation :geocode

  def editable_by? user
    owner == user
  end


  def self.search(category)
    if Category.find_by(name: category)
      Category.find_by(name: category).businesses
    else
      []
    end
  end
end
