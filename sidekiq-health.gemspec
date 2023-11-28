# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/health/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-health"
  spec.version       = Sidekiq::Health::VERSION
  spec.authors       = ["Tom de Vries"]
  spec.email         = ["tom@hackerone.com"]

  spec.summary       = %q{Monitor the size of your Sidekiq queues.}
  spec.description   = %q{Sidekiq::Health adds a rake task that outputs the
    current size our your Sidekiq queues.}
  spec.homepage      = "https://github.com/tomdev/sidekiq-health"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "railties", "~> 4.0"
  spec.add_development_dependency "sidekiq", "~> 3.0"
  spec.add_development_dependency "pry-rails"

  spec.add_dependency "hashie", "~> 3.6"
end
