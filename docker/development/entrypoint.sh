#!/bin/bash
set -e

sudo chown -R ec2-user /workspace/myapp

# Remove a potentially pre-existing server.pid for Rails.
rm -f ./tmp/pids/server.pid
rm -rf ./tmp/*
mkdir -p ./tmp/pids
touch tmp/pids/.keep

bundle install
bundle exec rails db:create db:migrate
# bundle exec rails db:create db:schema:load
# bundle exec rails db:seed_fu
bundle exec rails s -p 3001 -b 0.0.0.0
