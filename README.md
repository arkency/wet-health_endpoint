# Wet::HealthEndpoint

Adds `/health` endpoint to Rails app so it can be monitored.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wet-health_endpoint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wet-health_endpoint

### For Hanami Projects
You can use `wet-health_endpoint` middleware for specific hanami apps. For this you need to add middleware to your hanami app config:

```ruby
# in apps/web/application.rb

require 'wet/health_endpoint/middleware'

module Web
  class Application < Hanami::Application
    configure do
      # ...
      middleware.use Wet::HealthEndpoint::Middleware
      # ...
    end
  end
end
```

## Usage

```
$ curl -I http://example.com/health
HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: 89d3c0c8-0b5c-421b-83a1-757dd04fef30
X-Runtime: 0.000578
Connection: close
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arkency/wet-health_endpoint.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## About

<img src="http://arkency.com/images/arkency.png" alt="Arkency" width="20%" align="left" />

Health Endpoint is funded and maintained by Arkency. Check out our other [open-source projects](https://github.com/arkency).

You can also [hire us](http://arkency.com) or [read our blog](http://blog.arkency.com).
