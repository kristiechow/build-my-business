require 'rails_helper'

describe SessionsController do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    session[:user_id] = @user.id
  end

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    it "renders new template if incorrect user credentials" do
      post :create, :first_name => @user.first_name, :last_name => @user.last_name, :password => @user.password, :uid => @user.uid
      expect(response).to render_template(:new)
    end
  end
end