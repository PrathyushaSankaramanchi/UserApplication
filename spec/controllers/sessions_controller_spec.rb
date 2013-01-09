require 'spec_helper'

describe SessionsController do
   render_views
  
  describe "GET 'new'" do
    it "Sessions -> new route should successful" do
      get 'new'
      response.should be_success
    end
    
    it "Sessions -> new should have a right title" do
      get 'new'
      response.should have_selector("title", :content => "Sign in")
    end
  end
  
  describe "POST 'create'" do
    describe "invalid signin" do
      before(:each) do
        @user = mock_model(User)
        @attr = { :email => @user.email, :name => @user.name }
      end

      it "should have a flash.now message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
      
    end
    
    describe "with valid email and password" do
      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :name => @user.name }
      end
      
      it "should redirect to the user show page" do
        post :create, :session => @attr
        response.should redirect_to(home_path)
      end
    end

  end 
  
  describe 'DELETE destroy' do
    before :each do
      @user = mock_model(User)
    end
  
    it "deletes the user" do
      expect{
        delete :destroy, id: @user        
      }.to change(User,:count).by(0)
    end
      
    it "redirects to signin_url" do
      delete :destroy, id: @user
      response.should redirect_to signin_url
    end 

  end
end
