require 'wet/health_endpoint/middleware'

module Wet
  module HealthEndpoint
    class Railtie < Rails::Railtie
      initializer 'health_endpoint.routes' do |app|
        app.middleware.use Middleware, app.config.try(:health_endpoint)
      end
    end
  end
end

