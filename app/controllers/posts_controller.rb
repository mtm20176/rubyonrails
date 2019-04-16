=begin

Copyright (C) Mark Milligan - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by Mark Milligan <markmilligan@me.com>, 2019

=end

class PostsController < ApplicationController



	before_action :authenticate_user!, :except => [:show, :index, :export_posts]


	def initialize

		super
		@products = ["Darwin","DeepNLP","SparkPredict","DeepArmor"]

	end

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

		@posts = Post.all.user.select("posts.cached_votes_total, product, title, text, email, posts.created_at")

		if params[:sort] == "created_at" 
			@posts = @posts.order("posts.created_at desc")
		elsif params[:sort] == "email"
			@posts = @posts.order("users.email asc, posts.created_at desc")
		elsif params[:sort] == "product"
			@posts = @posts.order("posts.product asc, posts.created_at desc")			
		elsif params[:sort] == "votes"
			@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")			
		else
			@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")
		end

		respond_to do |format|
			format.csv { send_data @posts.to_csv }
		end

	end


	def upvote

	  	@post_id = params[:id].to_s
		@post = Post.find(params[:id])
	  	@user = current_user

		if @post.upvote_from @user
			redirect_to action: "index"
		else

		end

	end

	def unvote

	  	@post_id = params[:id].to_s
		@post = Post.find(params[:id])
	  	@user = current_user

		if @post.unliked_by @user
			redirect_to action: "index"
		  
		else
		  
		end

	end

	def index

		@posts = Post.all.user.select("posts.id, posts.user_id, title, text, product, users.email, posts.created_at, posts.cached_votes_total")

		@sort = params[:sort]

		if params[:sort] == "created_at" 
			@posts = @posts.order("posts.created_at desc")
			@sortname = "(sorted by date)"
		elsif params[:sort] == "email"
			@posts = @posts.order("users.email asc")
			@sortname = "(sorted by user)"
		elsif params[:sort] == "product"
			@posts = @posts.order("posts.product asc")	
			@sortname = "(sorted by product)"		
		elsif params[:sort] == "votes"
			@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")
			@sortname = "(sorted by votes)"			
		else
			@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")
			@sort = "votes"
			@sortname = "(sorted by votes)"
		end

		@posts = @posts.paginate(:page => params[:page], :per_page => 12) 


	end




private

	def post_params
		params.require(:post).permit(:title, :text, :product)
	end

	def makeflash
		#flash.now[:danger] = @bookmark.errors.full_messages
		flash.now[:danger] = @post.errors.full_messages
	end


end
