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

###### GitHub demo.cdr.dev Ruby-2-6-6 image
<a href="https://demo.cdr.dev/environments/git?org=5e274cb6-8ad3877561fcf4c2c4a95f3e&image=604d6a12-39ffa26caa24cf42ac78c1c1&tag=latest&service=github&repo=git@github.com:mtm20176/rubyonrails.git" target="_blank" rel="noopener noreferrer">
  <img src="https://cdn.coder.com/embed-button.svg" alt="Open in Coder with Ruby-2-6-6 image" width="263" height="40" />
</a>

##### GitHub mark.demo.coder.com Ruby-2-6-6 image with coder.yaml ( environment-as-code template )
[![Open in Coder](https://cdn.coder.com/embed-button.svg)](https://mark.demo.coder.com/wac/build?project_oauth_service=github&template_oauth_service=github&project_url=git@github.com:mtm20176/rubyonrails.git&template_url=https://github.com/mtm20176/ruby_wac&template_ref=master)

##### GitHub mark.demo.coder.com Ruby-2-6-6 image
<a href="https://mark.demo.coder.com/environments/git?org=default&image=604dfbc9-6b0c98d1c2912dd485245068&tag=latest&service=github&repo=git@github.com:mtm20176/rubyonrails.git" target="_blank" rel="noopener noreferrer">
  <img src="https://cdn.coder.com/embed-button.svg" alt="Open in Coder Enterprise" width="263" height="40" />
</a>

###### Notes / To run this app after cloning, we recommend:

* use an image with Ruby 2.6.6

* install bundler gem then bundle install the gems specified in the gem file

* install the Ruby gems ( they are not in my git to save space ): bundle install

 ( the following 2 steps may be needed if you get database errors when launching the rails app )

* run the database migrations: rails db:migrate RAILS_ENV=development

* run the seed data including login user names: rails db:seed

 * launch the app from the app folder: rails s -p 3000 -b 0.0.0.0

 ( the binding lets you access the app outside your localhost )

 * If running in a container, make sure you specify the ports in the docker run to setup port forwarding )

 * log in with the username admin@friends.com and password of password

 * API call #1 to demo in a browser: http://(your app host name)/api/get_posts_count.json

 * API call #2 to demo in a browser: http://(your app host name)/api/get_posts.json?term=

 * start debugger command: rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 1234 -- bin/rails s



