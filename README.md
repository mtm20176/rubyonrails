# Ruby on Rails application

This Ruby on Rails "RoR" application lets people in an organization to give feedback and rank it using a "thumbs up" approach.

###### Languages, frameworks used:

* Ruby 2.6.6

* Ruby on Rails 5.2.2

* SQLite3

* jQuery JavaScript library 3.3.1

* Bootstrap CSS for styling 4.2.1

* Devise gem for authentication

* will_paginate gem to handle split rows returned across pages

* acts_as_votable gem to up vote a feedback item

* 3 relational tables: users, posts, votes

###### GitLab integration to Coder remote development platform
<a href="https://demo.cdr.dev/environments/git?org=5e274cb6-8ad3877561fcf4c2c4a95f3e&image=5f0ce011-faad0c18b7a22214443b785b&tag=rubymine_v2&service=gitlab&repo=git@gitlab.com:mtm20176/rubyonrails.git" target="_blank" rel="noopener noreferrer">
  <img src="https://cdn.coder.com/embed-button.svg" alt="Open in Coder Enterprise" width="263" height="40" />
</a>


###### Notes / To run this app after cloning, we recommend:

* install rbenv to manage your Ruby environments and install Ruby 2.6.6

* install bundler gem then bundle install the gems specified in the gem file

* ensure Ruby on Rails 5.2.2 is installed locally

* install the Ruby gems ( they are not in my git to save space ): bundle install

* run the database migrations: rails db:migrate RAILS_ENV=development

* run the seed data including login user names: rails db:seed

 ( if you don't run these 2 steps, you'll get an error when launching the rails app )

 * launch the app from the app folder: rails s -p 3000 -b 0.0.0.0

 ( the binding lets you access the app outside your host )

 * If running in a Docker container, make sure you specify the ports in the docker run to setup port forwarding )

 * log in with the username admin@friends.com and password of password

