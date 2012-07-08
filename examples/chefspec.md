Fauxhai ChefSpec Examples
=========================

Mocking a Box
-------------
```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(platform:'ubuntu', version:'12.04')
  end
end
```

Mocking a Box with a Custom Ruby Version
----------------------------------------
```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(platform:'ubuntu', version:'12.04') do |node|
      node['languages']['ruby']['version'] = 'ree'
    end
  end
end
```

Mocking a Box with Custom Hostname
----------------------------------
```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(platform:'ubuntu', version:'12.04') do |node|
      node['hostname'] = 'server01.example.com'
    end
  end
end
```

Fetching a Remote Box
---------------------
```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(url:'server01.example.com')
  end
end
```

Fetching a Remote Box with custom Ruby Version
----------------------------------------------
```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(url:'server01.example.com') do |node|
      node['languages']['ruby']['version'] = 'ree'
    end
  end
end
```
