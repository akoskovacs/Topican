class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if (!user.nil? && user.try(:authenticate, params[:session][:password]))
      sign_in user
      flash[:success] = "Successful login"
      redirect_back_or_to user
    else
      flash.now[:error] = "Bad email or password!"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:sucess] = "Logout was successful!"
    redirect_to root_path
  end
end
