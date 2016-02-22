class Review < ActiveRecord::Base
  belongs_to :reviewee, class_name: 'User', foreign_key: :reviewee_id
  belongs_to :reviewer, class_name: 'User', foreign_key: :reviewer_id



  validates :communication_rating, presence: true
  validates :quality_rating, presence: true
  validates :timeliness_rating, presence: true
  validates :comment, presence: true


end
