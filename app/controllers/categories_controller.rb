class CategoriesController < ApplicationController
  before_filter :authenticate!

  def index
    @categories = Category.paginate(:page => params[:page])
  end
  
  def new
    @category = Category.new(:user => current_user)
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "Category created successfully!"
      redirect_to category_posts_path(@category)
    else
      flash[:error] = "Name must be given!"
      render :new
    end
  end

  def show
    @category = Category.find_by_id(params[:id])
    @posts = @category.posts
  end
end
