require "spec_helper"

describe "routes spec" do
  
  describe "routes for sign in" do
    
    it "should be routable to /signin" do
      expect(:get => "/signin").to be_routable
    end
    
    it "routes /signin to the sessions -> new controller" do
      expect(get("/signin")).to route_to("sessions#new")
    end
    
    it "should be routable to /signout" do
      expect(:get => "/signout").to be_routable
    end
    
    it "routes /signout to the sessions -> destroy controller" do
      expect(:get => "/signout").to route_to("sessions#destroy")
    end
    
    it "should be routable to /home" do
      expect(:get => "/home").to be_routable
    end
    
    it "routes /home to the home -> index controller" do
      expect(:get => "/home").to route_to("home#index")
    end
    
    it "should be routable to /cart" do
      expect(:get => "/cart").to be_routable
    end
    
    it "routes /cart to the cart -> show controller" do
      expect(:get => "/cart").to route_to("cart#show")
    end
    
  end
  
  describe "routes for users CRUD operations" do
  
      it "routes to #index" do
        expect(:get => "/users").to route_to("users#index")
      end
  
      it "routes to #new" do
        expect(:get => "/users/new").to route_to("users#new")
      end
  
      it "routes to #show" do
        expect(:get => "/users/1").to route_to("users#show", :id => "1")
      end
  
      it "routes to #edit" do
        expect(:get => "/users/1/edit").to route_to("users#edit", :id => "1")
      end
  
      it "routes to #create" do
        expect(:post => "/users").to route_to("users#create")
      end
  
      it "routes to #update" do
        expect(:put => "/users/1").to route_to("users#update", :id => "1")
      end
  
      it "routes to #destroy" do
        expect(:delete => "/users/1").to route_to("users#destroy", :id => "1")
      end
  
    end
    
    describe "routes for cart" do
    
      it "should be routable to /cart" do
        expect(:get => "/cart").to be_routable
      end
      
      it "routes /cart to the Cart -> show controller" do
        expect(:get => "/cart").to route_to("cart#show")
      end
    end
    
    describe "routes for home" do
    
      it "should be routable to /home" do
        expect(:get => "/home").to be_routable
      end
      
      it "routes /home to the Home -> index controller" do
        expect(:get => "/home").to route_to("home#index")
      end
    end
    
    describe "routes for Backbone - Sample" do
     
      it "should be routable to /sampleView" do
        expect(:get => "/sampleView").to be_routable
      end
      
      it "routes /sampleView to the Sample -> view controller" do
        expect(:get => "/sampleView").to route_to("sample#view")
      end
      
      it "should be routable to /sampleModel" do
        expect(:get => "/sampleModel").to be_routable
      end
      
      it "routes /sampleModel to the Sample -> model controller" do
        expect(:get => "/sampleModel").to route_to("sample#model")
      end
      
      it "should be routable to /sampleController" do
        expect(:get => "/sampleController").to be_routable
      end
      
      it "routes /sampleController to the Sample -> controller controller" do
        expect(:get => "/sampleController").to route_to("sample#controller")
      end
    end
end