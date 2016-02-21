class Business < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :photos
  has_many :category_businesses
  has_many :categories, through: :category_businesses

  geocoded_by :location 
  after_validation :geocode

  def editable_by? user
    owner == user
  end

end
