require 'rails_helper'

RSpec.describe Business, type: :model do
  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "Kristie", last_name: 'Chow', uid: 'kristie@email.com', password: '123456', type: 'Owner', provider: "buildmybusiness")

    @business = Business.create(name: "A Very Cool Business", description: "We like tech", location: "New York", owner_id: @user.id)

  end

  describe 'ActiveRecord associations' do
    it {expect(@business).to belong_to(:owner)}
    it {expect(@business).to have_many(:status_updates)}
    it {expect(@business).to have_many(:photos)}
    it {expect(@business).to have_and_belong_to_many(:categories)}
  end
end
