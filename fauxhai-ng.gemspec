lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'fauxhai/version'

Gem::Specification.new do |spec|
  spec.name          = 'fauxhai-ng'
  spec.version       = Fauxhai::VERSION
  spec.authors       = ['Tim Smith']
  spec.email         = ['tsmith84@gmail.com']
  spec.description   = 'Easily mock out ohai data'
  spec.summary       = 'Fauxhai provides an easy way to mock out your ohai data for testing with chefspec!'
  spec.homepage      = 'https://github.com/chefspec/fauxhai'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.3'

  spec.files         = %w{LICENSE} + Dir.glob("{lib,bin}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
  spec.executables   = 'fauxhai'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'net-ssh'

  spec.add_development_dependency 'chef', '>= 13.0'
  spec.add_development_dependency 'ohai', '>= 13.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rspec-its', '~> 1.2'
end
