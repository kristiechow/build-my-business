class Business < ActiveRecord::Base
  has_one :owner
  has_many :photos

  def editable_by? user
    owner == user
  end

end
