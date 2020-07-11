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
		#@post = Post.find(params[:id])	

		@posts = Post.user.where("posts.id = ?",params[:id]).select("posts.id, posts.user_id, title, text, product, status, notes, users.email, posts.created_at, posts.cached_votes_total, posts.anonymous")	
	
  		@posts.each do |post|

  			@post = post

  		end

	end


	def edit
		@post = Post.find(params[:id])
	end	


	def update

		@post = Post.find(params[:id])
	  	#@post.user_id = current_user.id

	  	#logger.info("PARAM title: " + params[:post][:title].to_s)
		#logger.info("DB title: " + @post.title)

	  	if ( PRODUCTMANAGERS.include?(current_user.email) || LEADERSHIP.include?(current_user.email) ) && (params[:post][:title] != @post.title || params[:post][:text] != @post.text || params[:post][:product] != @post.product  ) 

			flash.now[:danger] = "You only have permission to update the Status and Resolution Notes."
			render action: "edit"

			logger.info("hr, leadership and changed wrong fields")

		elsif (@post.user_id == current_user.id || ADMIN.include?(current_user.email) || (  ( PRODUCTMANAGERS.include?(current_user.email) || LEADERSHIP.include?(current_user.email) ) && ( params[:post][:notes] != @post.notes || params[:post][:status] != @post.status ) ) ) 

			logger.info("the user's post, or admin")

		  	if @post.update(post_params)

		  		redirect_to :action => "index"

		  		#redirect_to @post
				#render plain: params[:post].inspect

			else
				makeflash
				render action: "edit"
			end
		
		else

			logger.info("you don't have permissions")

			flash[:danger] = "You do not have permission to update the post."
			redirect_to :action => "index"

		end

	end


	def export_posts  

		@posts = Post.user.select("posts.id, posts.user_id, title, text, product, status, notes, users.email, posts.created_at, posts.cached_votes_total, posts.notes, posts.anonymous")

		if params[:sort] == "all"
			@posts = @posts.order("posts.status desc,posts.created_at desc")	
		elsif params[:sort] == "resolved"
			@posts = @posts.where("status = ?","Resolved").order("posts.status asc, posts.created_at desc")
		else			
			@posts = @posts.where("status = ?","Active")
			if params[:sort] == "created_at" 
				@posts = @posts.order("posts.created_at desc")
			elsif params[:sort] == "email"
				@posts = @posts.order("users.email asc")
			elsif params[:sort] == "product"
				@posts = @posts.order("posts.product asc")			
			elsif params[:sort] == "votes"
				@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")					
			else
				@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")
			end
		end

=begin 
		@posts = Post.all.user.select("posts.cached_votes_total, product, status, title, text, email, posts.created_at")

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
=end

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

		@posts = Post.user.select("posts.id, posts.user_id, title, text, product, status, notes, users.email, posts.created_at, posts.cached_votes_total, anonymous")

		@sort = params[:sort]

		if params[:sort] == "all"
			@posts = @posts.order("posts.status desc,posts.created_at desc")
			@sortname = "(all statuses)"	
		elsif params[:sort] == "resolved"
			@posts = @posts.where("status = ?","Resolved").order("posts.status asc, posts.created_at desc")
			@sortname = "(resolved status)"
		else			
			@posts = @posts.where("status = ?","Active")
			if params[:sort] == "created_at" 
				@posts = @posts.order("posts.created_at desc")
				@sortname = "(sorted by most recent)"
			elsif params[:sort] == "email"
				@posts = @posts.order("users.email asc")
				@sortname = "(sorted by user)"
			elsif params[:sort] == "product"
				@posts = @posts.order("posts.product asc")	
				@sortname = "(sorted by product)"		
			elsif params[:sort] == "votes"
				@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")
				@sortname = "(sorted by most votes)"						
			else
				@posts = @posts.order("posts.created_at desc")
				#@posts = @posts.order("posts.cached_votes_total desc, posts.created_at desc")
				@sort = "votes"
				@sortname = "(sorted by most recent)"
			end
		end

		@posts = @posts.paginate(:page => params[:page], :per_page => 50) 


	end




private

	def post_params
		params.require(:post).permit(:title, :text, :product, :status, :notes, :anonymous)
	end

	def makeflash
		#flash.now[:danger] = @bookmark.errors.full_messages
		flash.now[:danger] = @post.errors.full_messages
	end


end
