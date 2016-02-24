require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'ActiveModel Validations' do
    it { should validate_presence_of :communication_rating }
    it { should validate_presence_of :quality_rating }
    it { should validate_presence_of :timeliness_rating }
    it { should validate_presence_of :comment }
  end


  describe 'ActiveRecord associations' do
    it {should belong_to :reviewee}
    it {should belong_to :reviewer}
  end
end
