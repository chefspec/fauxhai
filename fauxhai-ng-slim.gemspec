lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'fauxhai/version'

Gem::Specification.new do |spec|
  spec.name          = 'fauxhai-ng-slim'
  spec.version       = Fauxhai::VERSION
  spec.authors       = ['Seth Vargo', 'Tim Smith']
  spec.email         = ['sethvargo@gmail.com', 'tsmith84@gmail.com']
  spec.description   = 'Easily mock out ohai data'
  spec.summary       = 'Fauxhai provides an easy way to mock out your ohai data for testing with chefspec! This "slim" version lacks the fauxhai binary and ships without any Ohai data and instead relies on fetching that data as needed from the source on GitHub.'
  spec.homepage      = 'https://github.com/chefspec/fauxhai'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.3'

  spec.files         = %w{LICENSE} + Dir['lib/**/*.rb'].reject { |f| File.directory?(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'net-ssh'

  spec.add_development_dependency 'chef', '>= 13.0'
  spec.add_development_dependency 'ohai', '>= 13.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rspec-its', '~> 1.2'
end
