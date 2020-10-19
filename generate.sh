#!/bin/bash

docker build -t docker-rails-generator .
NEW_APP_PATH=$PWD
NEW_RAILS_APP=myrailsapp
NEW_APP_COMPLETE_PATH=${NEW_APP_PATH}/${NEW_RAILS_APP}

docker run -it -v $NEW_APP_PATH:/app docker-rails-generator rails new --skip-bundle $NEW_RAILS_APP
cp -r ./docker-dev-files/* $NEW_APP_COMPLETE_PATH
cd myrailsapp
docker-compose build
docker-compose up -d
docker exec -it ${NEW_RAILS_APP}_dev_1 /bin/bash
#bundle install
#yarn
#rails webpacker:install
#rails db:migrate && rails db:setup
#rails server -b 0.0.0.0

