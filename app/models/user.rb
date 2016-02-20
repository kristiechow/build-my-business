class User < ActiveRecord::Base
  has_secure_password

  has_one :business, foreign_key: :owner_id
  has_many :written_reviews, class_name: "Review", foreign_key: :reviewer_id, dependent: :destroy
  has_many :received_reviews, class_name: "Review", foreign_key: :reviewee_id, dependent: :destroy
  has_many :written_messages, class_name: "Message", foreign_key: :from_user_id, dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: :to_user_id, dependent: :destroy

  has_attached_file :avatar, styles: {
                                        thumb: '100x100>',
                                        square: '200x200#',
                                        medium: '300x300>'
                                      }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_attachment_size :avatar, :less_than => 5.megabytes


   validates :email, presence: true, uniqueness: true
   validates :password, presence: true, length: { in: 6..20 }
   validates :first_name, presence: true
   validate :uid_uniqueness

  def uid_uniqueness
    if uid.present?
      validates :uid, uniqueness: { scope: :provider }
    end
  end


  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
        provider: auth['provider'],
        uid: auth['uid'],
        email: auth['info']['email'],
        first_name: auth['info']['name'][0],
        last_name: auth['info']['name'][1],
        password: "123456"
      )
  end
end
