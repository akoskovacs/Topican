class PostsController < ApplicationController
  before_filter :authenticate!
  before_filter :right_user?, :only => [:edit, :destroy]

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts.paginate(:page => params[:page])
  end
  
  def create
    @category = Category.find_by_id(params[:category_id])
    @post = @category.posts.build(params[:post])
    @post.user = current_user
    if @post.save
      flash[:success] = "The post saved successfully!"
      redirect_to category_posts_path(@category)
    else
      flash[:error] = "The content cannot be empty!"
      redirect_to category_posts_path(@category)
    end
  end

  def edit
    @category = Category.find_by_id(params[:category_id])
    @post = @category.posts.find_by_id(params[:post_id])
    right_user? @post.user
  end

  def update
    # TODO: Implement this
  end

  def destroy
    # TODO: Implement this
  end
end
