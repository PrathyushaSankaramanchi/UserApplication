module SessionsHelper
  def sign_in(user)
    current_user = user
  end
  
  def current_user
    @current_user
  end
  
  def sign_out
    current_user = nil
  end
end
