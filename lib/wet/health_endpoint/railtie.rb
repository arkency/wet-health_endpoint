module Wet
  module HealthEndpoint
    class Railtie < Rails::Railtie
      initializer 'health_endpoint.routes', after: :after_initialize do |app|
        app.routes.draw do
          get '/health', to: proc { [204, {}, ['']] }
        end
      end
    end
  end
end

