require 'rails_helper'

RSpec.describe StatusUpdate, type: :model do
  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "Kristie", last_name: 'Chow', uid: 'kristie@email.com', password: '123456', type: 'Owner', provider: "codetribute")

    @business = Business.create(name: "A Very Cool Business", description: "We like tech", location: "New York", owner_id: @user.id)
    @status_update = StatusUpdate.create(description: 'The website is create a lot of traffic', business_id: @business.id, percentage_revenue_increase: '5%')
    @photo = [File.new("#{Rails.root}/app/assets/images/barber1.jpg")]
  end


  describe 'ActiveRecord associations' do
    it {should belong_to :business}
    it {should have_many :photos}
  end

  describe '#create_photos' do
    it 'should add uploaded photos to the status updates of a business' do
       expect { @status_update.create_photos(@photo) }.to change( @status_update.photos, :length).from(0).to(1)
      @status_update.photos.first.delete
    end
  end
end
