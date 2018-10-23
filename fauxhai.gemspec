lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'fauxhai/version'

Gem::Specification.new do |spec|
  spec.name          = 'fauxhai'
  spec.version       = Fauxhai::VERSION
  spec.authors       = ['Seth Vargo']
  spec.email         = ['sethvargo@gmail.com']
  spec.description   = 'Easily mock out ohai data'
  spec.summary       = 'Fauxhai provides an easy way to mock out your ohai data for testing with chefspec!'
  spec.homepage      = 'https://github.com/chefspec/fauxhai'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.2.2'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(\..*|Gemfile|Rakefile|CONTRIBUTING.md|PLATFORMS.md|examples|spec)}) }
  spec.executables   = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'net-ssh'

  spec.add_development_dependency 'chef', '>= 12.0'
  spec.add_development_dependency 'ohai', '>= 8.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rspec-its', '~> 1.2'
end
