class StatusUpdate < ActiveRecord::Base
  belongs_to :business
  has_many :photos

  def create_photos(photographs)
    photographs.each do |image|
      self.photos.create(image: image)
    end
  end
end
