require 'test_helper'
require 'rack/test'

class Wet::HealthEndpointWithOptionsTest < Minitest::Test
  include Rack::Test::Methods

  APP_INSTANCE = Class.new(::Rails::Application) {
    config.eager_load = false
    config.secret_key_base = SecureRandom.hex(30)
    config.health_endpoint = {status: 200, path: '/ping'}
  }.initialize!

  def app
    APP_INSTANCE
  end

  def test_health_check_endpoint
    app.routes.clear!

    get '/ping'

    assert_equal 200, last_response.status
    assert_equal '', last_response.body
  end

  def test_health_check_does_not_override_app_endpoint
    app.routes.draw { get '/ping', to: proc { [200, {}, ['Yo!']] } }

    get '/ping'

    assert_equal 200, last_response.status
    assert_equal 'Yo!', last_response.body
  end
end
