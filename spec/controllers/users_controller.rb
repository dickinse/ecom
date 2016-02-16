require 'rails_helper'

describe UsersController, :type => :controller do

    before do
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
    end

    describe "get #show" do
      context "user is signed in" do
        before do
          sign_in @user
    end

    it "Loads correct user details" do
      get :show, id: @user.id
      expect(response).to have_http_status(200)
      expext(assigns(:user)).to eq @user
    end

    it "doesn't load second user" do
      get :show, id: @user.id
      expect(response).to redirect_to(root_path)
    end

  end

    context "No user is signed in" do
	     it "redirects to login" do
      get :show, id: @user.id
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
