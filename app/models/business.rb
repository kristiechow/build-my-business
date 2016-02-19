class Business < ActiveRecord::Base
  has_one :owner
  has_many :photos, as: :photoable
end
