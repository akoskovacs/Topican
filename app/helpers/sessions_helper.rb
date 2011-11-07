module SessionsHelper
  def sign_in(user)
    session[:user] = user.id
    self.current_user = user
  end

  def sign_out
    session.delete(:user)
    self.current_user = nil
  end

  def current_user
    @current_user ||= User.try(:find_by_id ,session[:user])
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end
end
