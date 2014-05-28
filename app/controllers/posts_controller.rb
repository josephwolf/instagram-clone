class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.create!(params[:post].permit(:imageurl, :description, :picture))
		@post.save!
		redirect_to '/'
	end

	def index
		redirect_to '/'
	end

end
