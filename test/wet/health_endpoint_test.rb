require 'test_helper'
require 'rack/test'

class Wet::HealthEndpointTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def test_health_check_endpoint
    get '/health'

    assert_equal 204, last_response.status
    assert_equal '',  last_response.body
  end
end

