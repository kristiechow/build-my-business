require 'rails_helper'

RSpec.describe StatusUpdate, type: :model do
  describe 'ActiveRecord associations' do
    it {should belong_to :business}
    it {should have_many :photos}
  end
end
