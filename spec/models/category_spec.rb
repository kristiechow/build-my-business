require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'ActiveRecord associations' do
    it {should have_and_belong_to_many :businesses}
  end
end
