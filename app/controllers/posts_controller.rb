class PostsController < ApplicationController
  before_filter :authenticate!
  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts
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
end
