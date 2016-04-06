#!/usr/bin/env bash

source /home/vagrant/.rvm/scripts/rvm

version=$1
gemset=$2

rvm use --install --create $version@$gemset
gem install bundle

