# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wet/health_endpoint/version'

Gem::Specification.new do |spec|
  spec.name          = "wet-health_endpoint"
  spec.version       = Wet::HealthEndpoint::VERSION
  spec.authors       = ["Arkency"]
  spec.email         = ["dev@arkency.com"]

  spec.summary       = %q{Adds "/health" endpoint to Rails app so it can be monitored}
  spec.homepage      = "https://github.com/arkency/wet-health_endpoint"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rack-test", "~> 0.6.3"
  spec.add_development_dependency "rails", "~> 5.0"
end
