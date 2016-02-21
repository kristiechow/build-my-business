class Business < ActiveRecord::Base
  has_one :owner
  has_many :photos
  has_many :category_businesses
  has_many :categories, through: :category_businesses

  geocoded_by :location 

  def editable_by? user
    owner == user
  end

end
