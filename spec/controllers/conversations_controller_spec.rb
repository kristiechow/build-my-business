require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    @user1 = User.create!(first_name: "tester", last_name: "namer", password: '123456', type: 'Developer', uid: "kristi@gmail.com")
    session[:user_id] = @user.id
  end

	describe "user" do
    it "#index" do
      get :index
      expect(assigns(:conversations)).to eq Conversation.all
    end

    it "#create" do
      params = Conversation.create!(sender_id: @user.id, recipient_id: @user1.id)
      expect(Conversation.all.count).to equal(1)
    end
  end
end
