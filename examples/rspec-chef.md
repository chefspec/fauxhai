Fauxhai Rspec-Chef Examples
===========================

Mocking a Box
-------------
```ruby
describe 'foo::bar' do
  let(:json_attributes) { Fauxhai::Mock.new(platform:'ubuntu', version:'12.04') }
end
```

Or as a default
```ruby
# spec/spec_helper.rb
RSpec.configure do |c|
  c.json_attributes = Fauxhai::Mock.new(platform:'ubuntu', version:'12.04')
end
```

Mocking a Box with a Custom Ruby Version
----------------------------------------
```ruby
describe 'foo::bar' do
  let(:json_attributes) do
    Fauxhai::Mock.new(platform:'ubuntu', version:'12.04') do |node|
      node['languages']['ruby']['version'] = 'ree'
    end
  end
end
```

Mocking a Box with Custom Hostname
----------------------------------
```ruby
describe 'foo::bar' do
  let(:json_attributes) do
    Fauxhai::Mock.new(platform:'ubuntu', version:'12.04') do |node|
      node['hostname'] = 'server01.example.com'
    end
  end
end
```

Fetching a Remote Box
---------------------
```ruby
describe 'foo::bar' do
  let(:json_attributes) { Fauxhai::Mock.new(url:'server01.example.com' }
end
```

Fetching a Remote Box with custom Ruby Version
----------------------------------------------
```ruby
describe 'foo::bar' do
  let(:json_attributes) do
    Fauxhai::Mock.new(url:'server01.example.com') do |node|
      node['languages']['ruby']['version'] = 'ree'
    end
  end
end
```
