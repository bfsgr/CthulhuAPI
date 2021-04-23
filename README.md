# CthulhuAPI

[![Ruby](https://github.com/bfsgr/CthulhuAPI/actions/workflows/ruby.yml/badge.svg)](https://github.com/bfsgr/CthulhuAPI/actions/workflows/ruby.yml)
[![Code Climate](https://codeclimate.com/github/bfsgr/CthulhuAPI.svg)](https://codeclimate.com/github/bfsgr/CthulhuAPI)
[![Test Coverage](https://api.codeclimate.com/v1/badges/80d0c3e199eccd70f485/test_coverage)](https://codeclimate.com/github/bfsgr/CthulhuAPI/test_coverage)

The API behind Cthulhu-vTable project

[Documentation](https://app.swaggerhub.com/apis-docs/bfsgr/CthulhuAPI/)

# Configuration

For production you have to add/update the following config with your host and port

```ruby
# config/environments/production.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

The code above is the default for development environment

# Running

First install all the required gems
```
bundle install
```

Then you can run the server in the desired environment (it defaults to development)
```
rails s
```

# Tests

```
rails test
```
Coverage results are under `coverage/` directory 

# License

AGPL-3.0
