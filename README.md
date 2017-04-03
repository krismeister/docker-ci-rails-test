# Docker Example App

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

## Create new User on Digital Ocean Droplet
Based on: https://gist.github.com/learncodeacademy/3cdb928c9314f98404d0
```
#login to Digital Ocean
ssh root@XXX.XXX.XXX.XXX
#not sure if you need this one:
sudo adduser deploy sudo
sudo passwd deploy
```

And Update the new password

Now login as that user 
```bash
ssh deploy@url.com
```

Make directory .ssh on the remote server and log out
```bash
mkdir .ssh
exit
```

Push your ssh key to the authorized_keys file on the remote server
```bash
scp ~/.ssh/id_rsa.pub deploy@url.com:~/.ssh/authorized_keys
```

Make new deploy user
```
### make temp folder
mkdir deleteme_circlecikey
ssh-keygen -t rsa -f ./deleteme_circlecikey/temp

# print private key and copy and paste into circleci
cat ./deleteme_circlecikey/temp

# print public key then copy and paste into digital ocean
scp ./deleteme_circlecikey/temp.pub deploy@url.com:~/.ssh/authorized_keys

# delete the temp folder
rm -r ./deleteme_circlecikey

```

This is a bare-bones, dockerized [Ruby on Rails](http://rubyonrails.org) application that demonstrates the configuration  outlined in the article ["Docker for an Existing Rails Application"](http://chrisstump.online/2016/02/20/docker-existing-rails-application/). You could use this code for a new Rails app that you want to use Docker with, or to easily follow along in the article. 

[![Book session on Codementor](https://cdn.codementor.io/badges/book_session_github.svg)](https://www.codementor.io/cstump?utm_source=github&utm_medium=button&utm_term=cstump&utm_campaign=github) if you need a hand dockerizing your Rails app.
