# generate-rails-app
This dockerfile can be used to generate a rails project on the command line withouth having to install ruby first.

##### Build the image:
* `docker build -t docker-rails-generator .`

##### Generate the Rails App in Your Local Filesystem: 
* `docker run -it -v $PWD:/app docker-rails-generator rails new --skip-bundle myrailsapp`

### To Run the Newly Generated Code in Docker, Follow These Steps:
* Copy the development docker files to the generated folder: `cp -r ./docker-dev-files/* myrailsapp`
* Enter the generated app folder: `cd myrailsapp`
* Build the container: `docker-compose build`
* Start the container: `docker-container up -d`
* Enter the Container: `docker exec -it myrailsapp_dev_1 /bin/bash`
* Install the gems: `bundle install`
* Run yarn: `yarn`
* Run: `rails webpacker:install`
* Setup the Database: `rails db:migrate && rails db:setup`
* Start the Server: `rails server -b 0.0.0.0`

