#! /usr/bin/env ruby
require 'net/https'
require 'net/http'
require 'uri'

require_relative '../helpers/xml_parser'
require_relative '../helpers/cart_helper'

include XMLParser 
include CartHelper
  
 class CartController < ApplicationController    

  def show
    @title = "ShoppingCart"
  
    response = CartHelper.getResponseData()
    
    reader = Reader.new(response.body)
    @cartVal = reader.getXMLData("//resources")           
  end  
   
end










