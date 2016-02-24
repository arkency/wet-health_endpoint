require 'test_helper'
require 'rack/test'

class Wet::HealthEndpointTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def test_health_check_endpoint
    Rails.application.routes.draw {}

    get '/health'

    assert_equal 204, last_response.status
    assert_equal '',  last_response.body
  end

  def test_health_check_does_not_override_app_endpoint
    Rails.application.routes.draw { get '/health', to: proc { [200, {}, ['Yo!']] } }

    get '/health'

    assert_equal 200,   last_response.status
    assert_equal 'Yo!', last_response.body

    Rails.application.routes.draw {}
  end
end

