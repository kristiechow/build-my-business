class Business < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :status_updates
  has_many :photos
  has_and_belongs_to_many :categories

  geocoded_by :location
  after_validation :geocode

  def editable_by? user
    owner == user
  end

  def create_photos(photographs)
    photographs.each do |image|
      self.photos.create(image: image)
    end
  end

end
