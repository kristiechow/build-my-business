require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    session[:user_id] = @user.id
  end

  describe "user" do

    context "#index" do
    it "#index" do
      get :index
      expect(assigns(:businesses).count).to eq Business.all.count
      end
    end

    context "#new" do
    it "is successful" do
      business = Business.new
      get :new
      expect(response).to render_template(:new)
      end
    end

    context "#create" do
     it "creates a new business if successful" do
      params = Business.new(name: "A Very Cool Business", description: "We like tech", location: "New York", owner_id: @user.id)
      params.save
      expect(Business.all.count).to equal(1)
      end
    end

    context "#update" do
      it "updates a business with valid params" do
        params = FactoryGirl.create(:business, name: "A Very Cool Business", description: "We like tech", location: "New York", owner_id: @user.id)
        expect{ put :update, id: params.id, business: {name: 'A Much Cooler Business'}}.to change{params.reload.name}
      end

      it "doesn't update a post when params are invalid" do
        params = FactoryGirl.create(:business, name: 'Old title')
        post_edit = put :update, id: params.id, business: {name: ''}
        expect( post_edit ).to redirect_to business_path(params.id)
      end
    end

    it "#destroy" do
      business = Business.new(name: "A Business", description: "We love tech", location: "New York City")
      business.save
      expect{business.destroy}.to change{Business.count}.by(-1)
    end
  end
end