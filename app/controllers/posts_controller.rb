class PostsController < ApplicationController

	before_action :authenticate_user!, :except => [:show, :index, :export_posts]

	def new

	end

	def create
	  	@post = Post.new(post_params)
	  	@post.user_id = current_user.id


		  	if @post.save

		  		redirect_to :action => "index"

		  		#redirect_to @post
				#render plain: params[:post].inspect

			else
				makeflash
				render action: "new"
			end

	end

	def show
		@post = Post.find(params[:id])
	end


	def edit
		@post = Post.find(params[:id])
	end	


	def update

		@post = Post.find(params[:id])
	  	@post.user_id = current_user.id


		  	if @post.update(post_params)

		  		redirect_to :action => "index"

		  		#redirect_to @post
				#render plain: params[:post].inspect

			else
				makeflash
				render action: "edit"
			end



	end


	def export_posts  

		@posts = Post.all.user.select("title, text, email, posts.created_at").order(created_at: :desc)

		respond_to do |format|
			format.csv { send_data @posts.to_csv }
		end

	end



	def index

		@posts = Post.all.user.select("posts.id, posts.user_id, title, text, users.email, posts.created_at")

		if params[:sort] == "created_at" 
			@posts = @posts.order("posts.created_at desc")
		elsif params[:sort] == "email"
			@posts = @posts.order("users.email asc")
		else
			@posts = @posts.order(created_at: :desc)
		end

		@posts = @posts.paginate(:page => params[:page], :per_page => 12) 


	end




private

	def post_params
		params.require(:post).permit(:title, :text)
	end

	def makeflash
		#flash.now[:danger] = @bookmark.errors.full_messages
		flash.now[:danger] = @post.errors.full_messages
	end


end
