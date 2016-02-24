require 'rails_helper'

RSpec.describe User, type: :model do

  context 'ActiveModel Validations' do
    let(:user) {FactoryGirl.build :user}
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :uid }
    it { should validate_uniqueness_of :uid }
  end

end
