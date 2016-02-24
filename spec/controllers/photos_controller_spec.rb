require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    session[:user_id] = @user.id
  end

  describe "user" do

    it "#create" do
      params = Photo.create!(image: File.new("#{Rails.root}/app/assets/images/barber1.jpg"))
      expect(Photo.all.count).to equal(1)
    end

    it "#destroy" do
      params = Photo.create!(image: File.new("#{Rails.root}/app/assets/images/barber1.jpg"))
      expect{params.destroy}.to change{Photo.count}.by(-1)
    end
  end
end