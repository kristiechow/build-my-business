require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    @user1 = User.create!(first_name: "tester", last_name: "namer", password: '123456', type: 'Developer', uid: "kristi@gmail.com")
    session[:user_id] = @user.id
  end

  describe "user" do

    context "#create" do
     it "creates a new review if successful" do
      params = Review.new(comment: 'This is a review', communication_rating: 3, quality_rating: 4, timeliness_rating: 4, reviewee_id: @user1.id, reviewer_id: @user.id, review_type: "Developer")
      params.save
      expect(Review.all.count).to equal(1)
      end
    end
  end
end