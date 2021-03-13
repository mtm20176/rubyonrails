class ApiController < ApplicationController

=begin

Copyright (C) Mark Milligan - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by Mark Milligan <markmilligan@me.com>, 2019

MTM 03/13/2021 add api actions for json response
=end

before_action :authenticate_user!, :except => [:get_posts, :get_posts_count]

# employee posts to the survey message board with keyword searh on title, text, product and notes columns
def get_posts

    @posts = Post.where("LOWER(title) like LOWER(?) OR LOWER(text) like LOWER(?) OR LOWER(product) like LOWER(?) OR LOWER(notes) like LOWER(?)", "%" + params[:term] + "%",  "%" + params[:term] + "%", "%" + params[:term] + "%",  "%" + params[:term] + "%")

    respond_to do |format|
    format.json { render json: @posts }
    end

end    

# return the number of total posts
def get_posts_count

    @posts = Post.all.size

    respond_to do |format|
    format.json { render json: @posts }
    end

end  

end