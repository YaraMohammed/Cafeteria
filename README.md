# README####

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


**run before testing locally 
bundle install --without production

**create data base and add admin to users 
rake db:create
rake db:migrate
rake db:seed

# to upload images to use it @ paperclip gem
*sudo yum install imagemagick
*sudo apt-get install imagemagick -y
**to login
localhost:3000/login
admin email : 'admin@cafeteria'
admin password : 'admin'
