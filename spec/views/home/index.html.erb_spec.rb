require 'spec_helper'

describe "home/index.html.erb" do
  
  describe "should have valid information" do    
        it "should have the h1 'Welcome'" do   
          render         
          rendered.should contain('Welcome')
        end          
  end
  
end
