#!/bin/bash

docker build -f dockerfile_for_api -t docker-rails-api-generator .

DEFAULT_PATH=${PWD%/*}

read -p "Enter path for newly generated API [$DEFAULT_PATH]: " NEW_APP_PATH
NEW_APP_PATH=${NEW_APP_PATH:-$DEFAULT_PATH}

read -p "Enter name for your new app [myrailsapi]: " NEW_RAILS_APP
NEW_RAILS_APP=${NEW_RAILS_APP:-myrailsapi}

NEW_APP_COMPLETE_PATH=${NEW_APP_PATH}/${NEW_RAILS_APP}

docker run -it -v $NEW_APP_PATH:/app docker-rails-api-generator rails new --api --skip-bundle $NEW_RAILS_APP
cp -r ./docker-dev-api-files/* $NEW_APP_COMPLETE_PATH
cd $NEW_APP_COMPLETE_PATH 
docker-compose build
docker-compose up -d
docker exec -it ${NEW_RAILS_APP}_dev_1 /bin/bash -c 'bundle install && yarn && rails webpacker:install && rails db:migrate && rails db:setup'
echo "Run: 'rails server -b 0.0.0.0' if you want to start up a server."
