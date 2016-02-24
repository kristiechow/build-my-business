require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    session[:user_id] = @user.id
  end

  describe "user" do
    it "#index" do
      get :index
      expect(assigns(:developers)).to eq Developer.all
    end

    it "#new" do
      developer = Developer.new
      get :new
      expect(response).to render_template(:new)
    end

    context "#update" do
      it "updates a developer with valid params" do
        params = Developer.create!(uid: "cool@gmail.com", first_name: "A Cool", last_name: "Developer", password: "123456", description: "I like tech", location: "New York", type: "Developer")
        expect{ put :update, id: params.id, developer: {first_name: 'A Cooler'}}.to change{params.reload.first_name}
      end

      it "doesn't update a post when params are invalid" do
        params = Developer.create!(uid: "cool@gmail.com", first_name: "A Cool", last_name: "Developer", password: "123456", description: "I like tech", location: "New York", type: "Developer")
        developer_edit = put :update, id: params.id, developer: {first_name: ''}
        expect( developer_edit ).to render_template(:edit)
      end
    end

    it "#destroy" do
      params = Developer.create!(uid: "cool@gmail.com", first_name: "A Cool", last_name: "Developer", password: "123456", description: "I like tech", location: "New York", type: "Developer")
      expect{params.destroy}.to change{Developer.count}.by(-1)
    end
  end
end