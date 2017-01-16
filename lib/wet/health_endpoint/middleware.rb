module Wet
  module HealthEndpoint
    class Middleware
      DEFAULT_OPTIONS = {status: 204, path: '/health'}

      def initialize(app, options)
        @app = app
        @options = options || DEFAULT_OPTIONS
      end

      def call(env)
        dup._call(env)
      end

      def _call(env)
        status, headers, body = @app.call(env)

        if status == 404 && env.fetch('PATH_INFO') == @options[:path]
          [@options[:status], {}, ['']]
        else
          [status, headers, body]
        end
      ensure
        body.close if body && body.respond_to?(:close) && $!
      end
    end
  end
end
