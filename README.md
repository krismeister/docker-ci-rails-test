# Rails Continous Integration with Docker

## Continous Integration with CircleCi
This repo is an example a Rails app with CircleCi continous integration. After any master commit: CircleCi builds the projects and deploys onto a staging server.

Here are the CircleCi build logs: https://circleci.com/gh/krismeister/docker-ci-rails-test/tree/master

## Local environment setup
Copy and rename `docker-compose.override.DEV` to `docker-compose.override.yml`. This file gives control on how your local machine will override the values in docker-compose.yml. Copy and rename `.env-DEV` to `.env`
```
cp docker-compose.override.DEV docker-compose.override.yml
cp .env-DEV .env
```


## Build the Application
```
docker-compose build
docker-compose run app rake db:create
docker-compose run app rake db:migrate
docker-compose up -d //-d means in background

# verify the postgres, nginx and app are running
docker ps

#stop this projects running docker instances
docker-compose stop
```

## SSH into the Image
```
# find ID of running instance.
docker ps

# connect with ssh to instance:
docker exec -it dockercirailstest_app_1 /bin/bash
```

This is a bare-bones, dockerized [Ruby on Rails](http://rubyonrails.org) application that demonstrates the configuration  outlined in the article ["Docker for an Existing Rails Application"](http://chrisstump.online/2016/02/20/docker-existing-rails-application/). You could use this code for a new Rails app that you want to use Docker with, or to easily follow along in the article. 
