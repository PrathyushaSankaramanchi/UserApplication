class CartBean

  attr_accessor :cartVal
  
  def initialize
    self.cartVal = []
  end  
  
  def to_s()
    return cartVal.to_s()
  end
  
end