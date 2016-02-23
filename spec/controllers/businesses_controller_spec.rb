require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do

  before(:each) do
    stub_authorize_user!
  end

  describe "user" do
    it "#index" do
      get :index
      expect(assigns(:businesses)).to eq Business.all
    end

    it "#new" do
      business = Business.new
      get :new
      expect(response).to render_template(:new)
    end

    context "#update" do
      it "updates a business with valid params" do
        params = FactoryGirl.create(:business, name: "A Cool Business", description: "We like tech", location: "New York")
        expect{ put :update, id: params.id, business: {name: 'A Cooler Business'}}.to change{params.reload.name}
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