require 'rails_helper'

describe SessionsController do

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create :user }
    it "redirects to root path or edit path if correct user credentials" do
      post :create, :first_name => user.first_name, :last_name => user.last_name, :password => user.password, :uid => user.uid
      expect(response).to render_template(:new)
    end
  end
end