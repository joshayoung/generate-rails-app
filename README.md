# generate-rails-app
This dockerfile can be used to generate a rails project on the command line withouth having to install ruby first.

##### Build the image:
* `docker build -t docker-rails-generator .`

##### Set the location for your new app to be saved:
NEW_APP_PATH=$PWD
  * If you want it saved somewhere besides your present working directory, change this value.

##### Set the name for your rails app:
NEW_RAILS_APP=myrailsapp
  * If you need your app to have a different name, change that here.

##### Generate the Rails App in Your Local Filesystem: 
* `docker run -it -v $NEW_APP_PATH:/app docker-rails-generator rails new --skip-bundle $NEW_RAILS_APP`

### To Run the Newly Generated Code in Docker, Follow These Steps:
* Copy the development docker files to the generated folder: `cp -r ./docker-dev-files/* $NEW_APP_PATH/$NEW_RAILS_APP`
  * `myrailsapp` is the name of the folder you created in the previous step.
* Enter the generated app folder: `cd myrailsapp`
* Build the container: `docker-compose build`
* Start the container: `docker-compose up -d`
* Enter the Container: `docker exec -it ${NEW_RAILS_APP}_dev_1 /bin/bash`
* Install the gems: `bundle install`
* Run yarn: `yarn`
* Run: `rails webpacker:install`
* Setup the Database: `rails db:migrate && rails db:setup`
* Start the Server: `rails server -b 0.0.0.0`

