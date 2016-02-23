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
      post :create, :first_name => user.first_name, :last_name => user.last_name, :password => user.password
      expect(response).to redirect_to root_path || edit_owner_path(user) || edit_developer_path(user)
    end
  end
end