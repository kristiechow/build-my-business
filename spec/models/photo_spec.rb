require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'ActiveRecord associations' do
    it {should belong_to :business}
    it {should belong_to :status_update}
  end
end
