# Installation

## Alias Localhost
  - run `sudo nano /etc/host`
  - add `127.0.0.1 stocktrack.com`

## Rails
  1. bundle install
  2. bundle exec rake db:create db:migrate

## Webpacker / JavaScript
  1. yarn install

# Run server
  - bundle exec rails s
  - Navigate to `http://stocktrack.com:3000`