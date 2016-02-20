class Business < ActiveRecord::Base
  has_one :owner
  has_many :photos
  has_many :category_businesses
  has_many :categories, through: :category_businesses

  def editable_by? user
    owner == user
  end

end
