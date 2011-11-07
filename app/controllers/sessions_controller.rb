class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user.nil? || user.try(:authenticate, params[:session][:password]).nil?
      flash.now[:error] = "Bad email or password!"
      redirect_to 'new'
    else
      flash[:notice] = "Successful login"
      redirect_to user
      sign_in user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
