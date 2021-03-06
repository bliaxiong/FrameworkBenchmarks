#!/bin/bash

fw_depends mysql rvm ruby-2.4

rvm ruby-$MRI_VERSION do bundle install --jobs=4 --gemfile=$TROOT/Gemfile --path=vendor/bundle

DB_HOST=${DBHOST} rvm ruby-$MRI_VERSION do bundle exec thin start -C config/thin.yml &
