require 'spec_helper'

describe HomeController do
  render_views
  
  describe "GET 'index'" do
    it "Home -> index route should successful" do
      get 'index'
      response.should be_success
    end
    
    it "Home -> index should have a right title" do
      get 'index'
      response.should have_selector("title", :content => "Welcome to Home Page")
    end     
    
  end

end
