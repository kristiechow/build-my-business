require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.build :user}

  describe 'ActiveModel Validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :uid }
  end


  describe 'ActiveRecord associations' do
    it {expect(user).to have_one(:business)}
    it {expect(user).to have_many(:sent_matches)}
    it {expect(user).to have_many(:received_matches)}
    it {expect(user).to have_many(:matches)}
    it {expect(user).to have_many(:matched_users)}
    it {expect(user).to have_many(:written_reviews)}
    it {expect(user).to have_many(:received_reviews)}
    it {expect(user).to have_many(:written_messages)}
    it {expect(user).to have_many(:received_messages)}
  end
end
