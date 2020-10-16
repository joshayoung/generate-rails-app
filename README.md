# generate-rails-app
This dockerfile can be used to generate a rails project on the command line withouth having to install ruby first.

##### Build the image:
* `docker build -t docker-rails-generator .`

##### Generate the Rails App in Your Local Filesystem: 
* `docker run -it -v $PWD:/app docker-rails-generator rails new --skip-bundle myrailsapp`
