class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: "Owner", foreign_key: :to_user_id
  belongs_to :recipient, class_name: "Developer", foreign_key: :to_user_id
  belongs_to :sender, class_name: "Owner", foreign_key: :from_user_id
  belongs_to :sender, class_name: "Developer", foreign_key: :from_user_id

  validates :content, presence: true
end
