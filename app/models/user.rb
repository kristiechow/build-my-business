class User < ActiveRecord::Base
  has_secure_password

  has_one :business, foreign_key: :owner_id
  has_many :written_reviews, class_name: "Review", foreign_key: :reviewer_id, dependent: :destroy
  has_many :received_reviews, class_name: "Review", foreign_key: :reviewee_id, dependent: :destroy
  has_many :written_messages, class_name: "Message", foreign_key: :from_user_id, dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: :to_user_id, dependent: :destroy

   validates :email, presence: true, uniqueness: true
   validates :username, presence: true, uniqueness: true
   validates :password, presence: true, length: { in: 6..20 }

end
