require 'spec_helper'
require 'webmock/rspec'
WebMock.allow_net_connect!

describe CartController do
  render_views
  
  describe "GET 'show'" do
    it "Cart -> show should be a successful route" do
      get 'show'
      response.should be_success
    end
    
    it "Cart -> show should have a right title" do
      get 'show'
      response.should have_selector("title", :content => "ShoppingCart")
    end 
    
  end
  
  describe "http rest api" do
    
    stub_response_mock_data = nil
    myResponse = nil
    
    before(:all) do
      stub_response_mock_data = File.read("/drive2/AptanaWorkspace/UserApplication/mockfiles/xml/cart/cart_xml_mock.xml").strip;
         
      stub_request(:get, "https://ecommerce1.qa.snapfish.com/v1/order?accountOid=5000050&partnerOid=1&label=mobile&tax=real&status=Browsing").with(:headers => {'Accept'=>'application/xml'}).
                                  to_return(:status => 200, :body => stub_response_mock_data, :headers => {})
      
      myResponse = CartHelper.getResponseData();     
    end
    
     it "should return successful response" do       
      expect(myResponse).to_not be_nil
     end
     
     it "should return the same data as that is mocked" do 
      expect(myResponse.body).to eq(stub_response_mock_data)      
     end    
    
     it "contains BRW status" do
       expect(myResponse).to contain 'BRW'
     end

  end      
end
