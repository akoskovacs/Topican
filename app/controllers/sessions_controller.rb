class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user.try(:authenticate, params[:session][:password]).nil?
      flash[:error] = "Bad email or password!"
      redirect_to 'new'
    else
      sign_in user
      flash[:error] = "Successful login"
      redirect_to user
    end
  end

  def destroy
  end
end
