class Business < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :photos
  has_many :business_categories
  has_many :categories, through: :business_categories

  geocoded_by :location 
  after_validation :geocode

  def editable_by? user
    owner == user
  end

end
