module CartHelper
  
  def CartHelper.getResponseData()    
    http = Net::HTTP.new("ecommerce1.qa.snapfish.com", "443")
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE  
    response = http.get("/v1/order?accountOid=5000050&partnerOid=1&label=mobile&tax=real&status=Browsing",initheader = {'Accept' =>'application/xml'})
    return response 
  end 
  
end
