require 'spec_helper'
require 'webmock/rspec'
WebMock.allow_net_connect!

describe CartHelper do
  
  before(:each) do
    myResponse = CartHelper.getResponseData(); 
  end  
  
  it "has a valid REST API call with a proper header" do
    
     WebMock.should have_requested(:get, "https://ecommerce1.qa.snapfish.com/v1/order?accountOid=5000050&partnerOid=1&label=mobile&tax=real&status=Browsing").
     with(:headers => {'Accept'=>'application/xml', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).once 
     
  end
  
  it "has a valid REST API call with a success status" do
     
     WebMock.should have_requested(:get, "https://ecommerce1.qa.snapfish.com/v1/order?accountOid=5000050&partnerOid=1&label=mobile&tax=real&status=Browsing").
     with(:status => 200).once  
  end
  
  after(:each) do
    myResponse = nil
  end
  
end
