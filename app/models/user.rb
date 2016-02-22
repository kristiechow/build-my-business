class User < ActiveRecord::Base
  has_secure_password

  has_many :sent_matches, class_name: "Match"
  has_many :received_matches, class_name: "Match", foreign_key: :matched_user_id
  has_many :matched_users, through: :matches
  has_one :business, foreign_key: :owner_id
  has_many :written_reviews, class_name: "Review", foreign_key: :reviewer_id, dependent: :destroy
  has_many :received_reviews, class_name: "Review", foreign_key: :reviewee_id, dependent: :destroy
  has_many :written_messages, class_name: "Conversation", foreign_key: :sender_id, dependent: :destroy
  has_many :received_messages, class_name: "Conversation", foreign_key: :recipient_id, dependent: :destroy

  has_attached_file :avatar, styles: {
                                        thumb: '100x100>',
                                        square: '200x200#',
                                        medium: '300x300>'
                                      }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_attachment_size :avatar, :less_than => 5.megabytes

   validates :first_name, presence: true
   validates :uid, uniqueness: { scope: :provider }, on: :create
   validates :uid, presence: true, on: :create

   def matched?(user)
      r_matches = self.received_matches.where(user: user)
      s_matches = self.sent_matches.where(matched_user: user)
      if r_matches != [] || s_matches != []
        return true
      else
        false
      end
   end

   def cross_type?(user)
    user.type != self.type
   end


  def reviewed?(user)
   reviews = self.received_reviews
   reviews.find_by(reviewer_id: user.id)
  end

  def self.sign_in_from_omniauth(auth, user_type=nil)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth, user_type)
  end

  def self.create_user_from_omniauth(auth, user_type)
    if user_type == "Owner"
    @owner = create!(
        provider: auth['provider'],
        uid: auth['uid'],
        first_name: auth['info']['name'].split.first,
        last_name: auth['info']['name'].split[1],
        password: "123456",
        type: "Owner"
      )
    elsif user_type == "Developer"
    @developer = create!(
        provider: auth['provider'],
        uid: auth['uid'],
        first_name: auth['info']['name'].split.first,
        last_name: auth['info']['name'].split[1],
        password: "123456",
        type: "Developer"
      )
    else
      raise 'We do not know that user type'
    end
  end
end

