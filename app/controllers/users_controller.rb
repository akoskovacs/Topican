class UsersController < ApplicationController
  before_filter :authenticate!, :except => [:new, :create]

  def index
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
    @title = "Create a new user"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user, :success => "Welcome!"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  def profile
    @user = current_user
    render :show
  end
end
