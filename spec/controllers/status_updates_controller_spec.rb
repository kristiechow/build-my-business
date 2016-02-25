require 'rails_helper'

RSpec.describe StatusUpdatesController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    @business = Business.create!(name: "A Very Cool Business", description: "We like tech", location: "New York", owner_id: @user.id)
    session[:user_id] = @user.id
  end

  describe "user" do

    context "#new" do
    it "is successful" do
      update = StatusUpdate.new
      get :new, business_id: @business.id
      expect(response).to render_template(:new)
      end
    end

    context "#create" do
     it "creates a new update if successful" do
      update = StatusUpdate.new(description: 'This is a status update', percentage_revenue_increase: '5%', business_id: @business.id)
      update.save
      expect(StatusUpdate.all.count).to equal(1)
      end
    end

    it "#destroy" do
      update = StatusUpdate.create!(description: 'This is a status update', percentage_revenue_increase: '5%', business_id: @business.id)
      expect{update.destroy}.to change{StatusUpdate.count}.by(-1)
    end
  end
end