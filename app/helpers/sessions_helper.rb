module SessionsHelper
  def sign_in(user)
    session[:user] = user.id
    self.current_user = user
  end

  def self.current_user
    @current_user ||= User.find(session[:user])
  end

  def signed_in?
    @current_user.nil? ? false : true
  end
end
