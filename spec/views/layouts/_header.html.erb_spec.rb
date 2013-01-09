require 'spec_helper'

describe "layouts/_header.html.erb" do
  
  describe "should have valid information that" do  
    
        it "should have the selector called 'header'" do   
          render         
          rendered.should have_selector('header')
        end 
        
        it "should have the selector called 'div'" do   
          render         
          rendered.should have_selector('div')
        end   
        
  end
  
  describe "should be success once user is signed in" do
      describe "success" do  
        
        before(:each) do
          session[:user] = Factory(:user)
        end
        
        it "should have new link called home" do          
          render
          rendered.should have_selector 'a',:href => '/home',:content => 'Home'
        end
        
        it "should have a new link called cart" do          
          render
          rendered.should have_selector 'a',:href => '/cart',:content => 'Cart'
        end
        
        it "should have a new link called sign out" do          
          render
          rendered.should have_selector 'a',:href => '/signout',:content => 'Sign out'
        end
      end 
   
   
    describe "failure" do
        
        it "should not have a new link called home" do          
          render
          rendered.should_not have_selector 'a',:href => '/home',:content => 'Home'
        end
        
        it "should not have a new link called cart" do          
          render
          rendered.should_not have_selector 'a',:href => '/cart',:content => 'Cart'
        end
        
        it "should not have a new link called sign out" do          
          render
          rendered.should_not have_selector 'a',:href => '/signout',:content => 'Sign out'
        end
      end      
   end
   
end