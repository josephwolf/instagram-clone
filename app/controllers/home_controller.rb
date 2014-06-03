class HomeController < ApplicationController

	before_action :auth_user!

  def index
    @posts = Post.all
  end

end

def auth_user!
	return true if admin_signed_in?
    authenticate_user!
end

 #  def new
 #    @post = Post.new
 #  end

 #  def create
 #    @post = Post.new(params[:post].permit(:title, :description, :picture))
	# @post.user = current_user
	# @post.save!    
 #    redirect_to posts_path
 #  end
