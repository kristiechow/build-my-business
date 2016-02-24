require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    @user1 = User.create!(first_name: "tester", last_name: "namer", password: '123456', type: 'Developer', uid: "kristi@gmail.com")
    @conversation = Conversation.create!(sender_id: @user.id, recipient_id: @user1.id)
    session[:user_id] = @user.id
  end

  describe "user" do

    context "#create" do
     it "creates a new message" do
      params = Message.new(body: "Hello, this is a message", user_id: @user.id, conversation_id: @conversation.id)
      params.save
      expect(Message.first).to eq params
      end
    end
  end
end