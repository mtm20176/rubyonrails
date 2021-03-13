=begin

Copyright (C) Mark Milligan - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by Mark Milligan <markmilligan@me.com>, 2019

=end

Rails.application.routes.draw do

	devise_for :users

	get 'home/index'
	get 'posts/export_posts'
	get 'posts/upvote'
	get 'posts/unvote'		
	
#	get 'posts/export_posts', defaults: { format: :csv }

	resources :posts
	resources :admin

	# api
	get 'api/get_posts'
	get 'api/get_posts_count'

	root 'posts#index'
#	root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
