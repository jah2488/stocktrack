# Installation

## Alias Localhost
  - run `sudo vim /etc/host`
  - add `127.0.0.1 stocktrack.com`

## Rails
  1. bundle install
  2. bundle exec rake db:create db:migrate

## Webpacker / JavaScript
  1. yarn install

# Run server
  - bundle exec rails s
  - Navigate to `http://stocktrack.com:3000`

# View On Heroku
  - https://stock-insight.herokuapp.com/

# Feature Roadmap
  - https://github.com/jah2488/stocktrack/projects/1

# Sorbet
  - docs https://sorbet.org/docs/overview
  - init `srb init`
  - run `srb tc`

# IEX Cloud
- https://github.com/dblock/iex-ruby-client

### Initializing
  - client = IEX::Api::Client.new

### Free Tier endpoints
  - client.quote('SPY')
  - client.company('SPY')
  - client.logo('SPY')
  - client.news('SPY')
  - client.chart('SPY')
  - client.key_stats('SPY')
  - client.dividends('SPY', '6m')
  - client.earnings('MSFT')
  - client.crypto('BTCUSDT')
