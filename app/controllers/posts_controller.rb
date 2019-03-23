class PostsController < ApplicationController

	def new

	end

	def create
  
	  	@post = Post.new(post_params)

	  	@post.save

	  	redirect_to :action => "index"

	  	#redirect_to @post
		#render plain: params[:post].inspect

	end

	def show

		@post = Post.find(params[:id])

	end


	def index

		@posts = Post.all.order(created_at: :desc)

	end



private
	def post_params
		params.require(:post).permit(:title, :text)
	end


end
