module Wet
  module HealthEndpoint
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        dup._call(env)
      end

      def _call(env)
        status, headers, body = @app.call(env)
        return [204, {}, ['']] if status == 404 && env.fetch('PATH_INFO') == '/health'
        [status, headers, body]
      ensure
        body.close if body && body.respond_to?(:close) && $!
      end
    end
  end
end
