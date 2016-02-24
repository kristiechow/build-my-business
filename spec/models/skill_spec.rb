require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'ActiveRecord associations' do
    it {should have_and_belong_to_many :developers}
  end
end
