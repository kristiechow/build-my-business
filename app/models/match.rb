class Match < ActiveRecord::Base
  belongs_to :user
  belongs_to :matched_user, class_name: "User"


  def update_status
    if self.user.type == "owner"
      self.user.business.update_attributes(status: "In progress")
    else
      self.matched_user.business.update_attributes(status: "In progress")
    end
  end

end
