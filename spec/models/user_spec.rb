require 'spec_helper'

describe User do
  
  describe "should be valid creating a sample name and email" do
    
    before(:each) do
      @attr = {:name=>"example",:email=>"user@example.com"}
    end
    
    it "should create a new instance of user" do
      User.create!(@attr).should be_valid
    end
    
    it "should require a name" do
      no_name_user = User.new(@attr.merge(:name => ""))
      no_name_user.should_not be_valid
    end
    
    it "should contain an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end
    
    it "should reject names that are too long" do    
      long_name_user = User.new(@attr.merge(:name => 'a' * 51))
      long_name_user.should_not be_valid
    end
    
    it "should contain valid email address" do
      addresses = %w[abc@email.com abc_abc@email.com abc.abc@email.com]
      addresses.each { |address|
        valid_email_address = User.new(@attr.merge(:email => address))
        valid_email_address.should be_valid
        }
    end
    
    it "should not contain invalid email address" do
      addresses = %w[abc@email,com abc_abc_at_email.com abc.email@com.]
      addresses.each { |address|
        invalid_email_address = User.new(@attr.merge(:email => address))
        invalid_email_address.should_not be_valid
        }
    end
    
    it "should not contain duplicate email address" do
      upcased_email_address = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email_address))
      duplicate_email_address = User.new(@attr)
      duplicate_email_address.should_not be_valid
    end
  
  end

  describe "mock the model User" do
    it "assigns the current user" do
      user = mock_model("User")
      user.should be_a(User)
    end
  end
  
  describe "should mock the user model" do
    let(:user) { mock_model(User) }

    it "is valid by default" do
      user.should be_valid
    end
  
    it "is not a new record by default" do
      user.should_not be_new_record
    end
  
    it "can be converted to a new record" do
      user.as_new_record.should be_new_record
    end
  
    it "sets :id to nil upon destroy" do
      user.destroy
      user.id.should be_nil
    end

  end
end