class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.create!(params[:post].permit(:imageurl, :description))
		redirect_to '/'
	end

end
