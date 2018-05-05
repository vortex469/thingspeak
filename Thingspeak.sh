#!/bin/bash

# Install Thingspeak server on Raspberry Pi running Raspbian.

# Based on work of Andrew Bythell <abythell@ieee.org> and Silvio <tnw513>



# Install required packages

sudo apt-get update

sudo apt-get -y upgrade

sudo apt-get -y install build-essential mysql-server mysql-client libmysqlclient-dev libssl-dev libsqlite3-dev

sudo apt-get -y install libxml2-dev libxslt-dev git-core curl rubygems

sudo apt-get -y install ruby2.1 ruby2.1-dev

Sudo apt-get -y autoremove

## Install thingspeak

git clone https://github.com/vortex469/thingspeak

cd thingspeak

gem install minitest -v '4.7.5'

gem install json -v '1.8.1'

gem install nokogiri -- --use-system-libraries

gem install bundler

bundle install

cp config/database.yml.example config/database.yml

rake db:create

rake db:schema:load

rails server webrick
