require 'spec_helper.rb'

describe "sessions/new.html.erb" do
  
    describe "signin page" do
      it "should have the content called 'Sign in'" do   
          render         
          rendered.should contain('Sign in')
      end
      
      it "should have the selector called 'div'" do   
          render         
          rendered.should have_selector('div')
      end
      
      it "should have the selector called 'table'" do   
          render         
          rendered.should have_selector('table')
      end
      
      it "should have the selector called 'title'" do   
          render         
          rendered.should have_selector('title')
      end
      
      it "should have the selector called 'h1'" do   
          render         
          rendered.should have_selector('h1')
      end        
      
    end    
    
end