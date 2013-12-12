lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fauxhai'
  spec.version       = '2.0.1'
  spec.authors       = ['Seth Vargo']
  spec.email         = ['sethvargo@gmail.com']
  spec.description   = %q{Easily mock out ohai data}
  spec.summary       = %q{Fauxhai provides an easy way to mock out your ohai data for testing with chefspec!}
  spec.homepage      = 'https://github.com/customink/fauxhai'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 1.9'

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'net-ssh'
  spec.add_runtime_dependency 'ohai'

  spec.add_development_dependency 'rake'
end
