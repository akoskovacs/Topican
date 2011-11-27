class CategoriesController < ApplicationController
  before_filter :authenticate!

  def index
    @categories = Category.paginate(:page => params[:page])
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    @category.user = current_user
    if @category.save
      flash[:success] = "Category created successfully!"
      redirect_to category_posts_path(@category)
    else
      flash[:error] = "Name must be given!"
      render :new
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update
    @category = Category.find_by_id(params[:id])
    @category.update_attributes(params[:category])
    right_user?(@category.user)
    @category.user = current_user
    if @category.save
      flash[:sucess] = "Category saved"
      redirect_to category_posts_path(@category)
    else
      flash[:error] = "Category cannot saved!"
      render :edit
    end
  end

  def show
    @category = Category.find_by_id(params[:id])
    @posts = @category.posts
  end
end
