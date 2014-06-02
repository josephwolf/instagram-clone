class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(params[:post].permit(:title, :description, :picture, :tag_names))
    @post.user = current_user
    @post.save!
    redirect_to '/'
  end

  def index
    params[:take] ||= 3
  	render json: current_user.posts[params[:skip].to_i-1..params[:take].to_i]
  end

  def destroy
    @post = current_user.posts.find params[:id]
    @post.destroy

    flash[:notice] = 'Post deleted!'
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'This is not your post!'
  ensure
    redirect_to '/posts'
  end
end

