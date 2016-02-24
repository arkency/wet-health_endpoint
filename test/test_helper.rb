$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'minitest/autorun'
require 'action_controller/railtie'
require 'wet/health_endpoint'

class DummyApplication < ::Rails::Application
  config.eager_load      = false
  config.secret_key_base = SecureRandom.hex(30)
end

DummyApplication.initialize!
DummyApplication.routes.default_url_options[:host] = 'example.com'

