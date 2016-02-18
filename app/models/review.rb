class Review < ActiveRecord::Base
  belongs_to :reviewee, class_name: 'Developer'
  belongs_to :reviewer, class_name: 'Developer'

  belongs_to :reviewer, class_name: 'Owner'

  validates :communication_rating, presence: true
  validates :quality_rating, presence: true
  validates :timeliness_rating, presence: true
  validates :comment, presence: true
end
