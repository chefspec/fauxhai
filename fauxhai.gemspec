lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

Gem::Specification.new do |gem|
  gem.version       = '0.0.2.alpha'
  gem.authors       = ["Seth Vargo"]
  gem.email         = ["svargo@customink.com"]
  gem.description   = %q{Easily mock out ohai data}
  gem.summary       = %q{Fauxhai provides an easy way to mock out your ohai data for testing with chefspec!}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fauxhai"
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'chef'
end
