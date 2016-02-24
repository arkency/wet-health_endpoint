# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wet/health_endpoint/version'

Gem::Specification.new do |spec|
  spec.name          = "wet-health_endpoint"
  spec.version       = Wet::HealthEndpoint::VERSION
  spec.authors       = ["Szymon Fiedler"]
  spec.email         = ["fidelski@gmail.com"]

  spec.summary       = %q{Adds "/health" endpoint to Rails app so it can be monitored}
  spec.homepage      = "https://github.com/wetrb/wet-health_endpoint"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rack-test", "~> 0.6.3"
  spec.add_development_dependency "rails", "~> 4.1"
end
