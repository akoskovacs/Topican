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
    @current_user ||= User.try(:find_by_id, session[:user])
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate!
    unless signed_in?
      deny_access!
    end
  end

  def deny_access!
      flash[:error] = "You must be logged in to see this page!"
      store_location
      redirect_to login_path
  end

  def forbidden!
      flash[:error] = "Access denied!" 
      redirect_to categories_path
  end

  def store_location
    cookies[:forward_to] = request.fullpath
  end

  def redirect_back_or_to(uri)
    if (cookies[:forward_to].nil?)
      redirect_to uri
    else
       path = cookies[:forward_to]
       clear_location
       redirect_to path
    end
  end

  def clear_location
    cookies.delete(:forward_to)
  end

  def right_user?(user = nil)
    if user.nil?
      if current_user != User.find_by_id(params[:id])
        forbidden!
      end
    else
      if user != current_user
        forbidden!
      end
    end
  end
end
