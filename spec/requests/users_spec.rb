require 'spec_helper'

describe "Users" do
 describe "GET /users" do
   describe "sign in/out" do
    
      describe "failure" do
  
        it "should not sign the user in" do
          visit signin_path
          fill_in :name, :with => ""
          fill_in :email, :with => ""
          click_button
          response.should render_template('sessions/new')
        end      
          
        it "should not make a new user" do
          lambda do
          visit signin_path
          fill_in "Name", :with => ""
          fill_in "Email", :with => ""
          click_button
          response.should render_template('sessions/new')
          end.should_not change(User, :count)
        end
  
      end 
      
      
     describe "success" do
      it "should sign a user in and out" do
        user = Factory(:user)
        visit signin_path
        fill_in :email, :with => user.email
        fill_in :name, :with => user.name
        click_button
        response.should render_template('home/index')
        click_link "Sign out"
        response.should render_template('sessions/new')
      end          
    end
    
  end
 end
end