class Review < ActiveRecord::Base
  belongs_to :reviewee, class_name: 'User'
  belongs_to :reviewer, class_name: 'User'

  validates :communication_rating, presence: true
  validates :quality_rating, presence: true
  validates :timeliness_rating, presence: true
  validates :comment, presence: true
end
