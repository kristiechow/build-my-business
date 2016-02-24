require 'rails_helper'

RSpec.describe OwnersController, type: :controller do

  before(:each) do
    stub_authorize_user!
    @user = User.create!(first_name: "test", last_name: "name", password: '123456', type: 'Owner', uid: "kristie@gmail.com")
    session[:user_id] = @user.id
  end

  describe "user" do

    it "#new" do
      owner = Owner.new
      get :new
      expect(response).to render_template(:new)
    end

    context "#update" do
      it "updates a developer with valid params" do
        params = Owner.create!(uid: "cool@gmail.com", first_name: "A Cool", last_name: "Owner", password: "123456", description: "I like tech", location: "New York", type: "Owner")
        expect{ put :update, id: params.id, owner: {first_name: 'A Cooler'}}.to change{params.reload.first_name}
      end

      it "doesn't update a post when params are invalid" do
         params = Owner.create!(uid: "cool@gmail.com", first_name: "A Cool", last_name: "Owner", password: "123456", description: "I like tech", location: "New York", type: "Owner")
        owner_edit = put :update, id: params.id, owner: {first_name: ''}
        expect( owner_edit ).to render_template(:edit)
      end
    end

    it "#destroy" do
      params = Owner.create!(uid: "cool@gmail.com", first_name: "A Cool", last_name: "Owner", password: "123456", description: "I like tech", location: "New York", type: "Owner")
      expect{params.destroy}.to change{Owner.count}.by(-1)
    end
  end
end