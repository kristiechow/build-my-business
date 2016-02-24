require 'rails_helper'

RSpec.describe MatchesController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    @user1 = User.create!(first_name: "tester", last_name: "namer", password: '123456', type: 'Developer', uid: "kristi@gmail.com")
    session[:user_id] = @user.id
  end

  describe "user" do

    context "#create" do
     it "creates a new match" do
      params = Match.new(user: @user, matched_user: @user1, accepted: false, status: "Pending")
      params.save
      expect(Match.all.count).to equal(1)
      end
    end

    context "#update" do
      it "updates a business with valid params" do
        params = Match.create!(user: @user, matched_user: @user1, accepted: false, status: "Pending")
        expect{ put :update, id: params.id, match: {status: "Matched!"}}.to change{params.reload.status}
      end
    end

    it "#destroy" do
      params = Match.create!(user: @user, matched_user: @user1, accepted: false, status: "Pending")
      expect{params.destroy}.to change{Match.count}.by(-1)
    end
  end
end