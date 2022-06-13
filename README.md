# Fauxhai-ng

![CI](https://github.com/chefspec/fauxhai/workflows/CI/badge.svg) [![Gem Version](https://badge.fury.io/rb/fauxhai-ng.svg)](https://badge.fury.io/rb/fauxhai-ng)

Note: fauxhai-ng is an updated version of the original fauxhai gem. The CLI and library namespaces have not changed, but you will want to update to use the new gem.

Fauxhai is a gem for mocking out [ohai](https://github.com/chef/ohai) data in your chef testing. Fauxhai is community supported, so we need **your help** to populate our dataset. Here's an example for testing my "awesome_cookbook" on Ubuntu 20.04:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(platform: 'ubuntu', version: '20.04')
  end

  it 'should install awesome' do
    @runner = ChefSpec::ChefRunner.new.converge('tmpreaper::default')
    expect(@runner).to install_package 'awesome'
  end
end
```

Alternatively, you can pull "real" Ohai data from an existing server:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.fetch(host: 'server01.example.com')
  end

  it 'should install awesome' do
    @runner = ChefSpec::ChefRunner.new.converge('tmpreaper::default')
    expect(@runner).to install_package 'awesome'
  end
end
```

## Important Note

Fauxhai ships with a command line tool - `fauxhai`. This is **not** the same as Fauxhai.mock. Running `fauxhai` on a machine effectively runs `ohai`, but then sanitizes the data, removing/replacing things like:

- users
- ssh keys
- usernames in paths
- sensitive system information

`fauxhai` should only be used by developers wishing to submit a new json file.

## Platform and Versions

For a complete list of platforms and versions available for mocking via Fauxhai see [PLATFORMS.MD](https://github.com/chef/fauxhai/blob/master/PLATFORMS.md) in this repository.

## Usage

Fauxhai provides a bunch of default attributes so that you don't need to mock out your entire infrastructure to write a simple test. That being said, not all configurations will suit your needs. Because of that, Fauxhai provides two ways to configure your mocks:

### Overriding

`Fauxhai.mock` will also accept a block with override attributes that are merged with all the default attributes. For example, the default Ubuntu 12.04 mock uses `Ruby 1.9.3`. Maybe your system is using `ree`, and you want to verify that the cookbooks work with that data as well:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(platform: 'ubuntu', version: '12.04') do |node|
      node['languages']['ruby']['version'] = 'ree'
    end
  end

  it 'should install awesome' do
    @runner = ChefSpec::ChefRunner.new.converge('tmpreaper::default')
    expect(@runner).to install_package 'awesome'
  end
end
```

The `node` block variable allows you to set any Ohai attribute on the mock that you want. This provides an easy way to manage your environments. If you find that you are overriding attributes like OS or platform, you should see the section on Contributing.

### Fetching

Alternatively, if you do not want to mock the data, Fauxhai provides a `fetch` mechanism for collecting "real" Ohai data from a remote server or local file. Maybe you want to test against the fully-replicated environment for a front-facing server in your pool. Just pass in the `url` option instead of a `platform`:

The `fetch` method supports all the same options as the Net-SSH command, such as `:user`, `:password`, `:key_file`, etc.

The `fetch` method will cache the JSON file in a temporary path on your local machine. Similar to gems like VCR, this allows Fauxhai to use the cached copy, making your test suite run faster. You can optionally force a cache miss by passing the `:force_cache_miss => true` option to the `fetch` initializer. **Because this is real data, there may be a security concern. Secure your laptop accordingly.**

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.fetch(host: 'server01.example.com')
  end

  it 'should install awesome' do
    @runner = ChefSpec::ChefRunner.new.converge('tmpreaper::default')
    expect(@runner).to install_package 'awesome'
  end
end
```

This will ssh into the machine (you must have authorization to run `sudo ohai` on that machine), download a copy of the Ohai output, and optionally cache that data inside the test directory (speeding up future tests).

### Overriding + Fetching

As you might expect, you can combine overriding and fetching like so:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.fetch(host: 'server01.example.com') do |node|
      node['languages']['ruby']['version'] = 'ree'
    end
  end

  it 'should install awesome' do
    @runner = ChefSpec::ChefRunner.new.converge('tmpreaper::default')
    expect(@runner).to install_package 'awesome'
  end
end
```

### Fixturing

If you want to use Fauxhai as "fixture" data, you can store real JSON in your project and use the `:path` option:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(path: 'fixtures/my_node.json')
  end
end
```

### Overriding + Fixturing

You can also change specific attributes in your fixture:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(path: 'fixtures/my_node.json') do |node|
      node['languages']['ruby']['version'] = 'ree'
    end
  end
end
```

### Disabling Fetching from Github

On environments that does not have access to the internet, you can disable fetching Fauxhai data from GitHub as follow:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  before do
    Fauxhai.mock(platform: 'ubuntu', version: '12.04', github_fetching: false)
  end
end
```

## Testing Multiple Versions

It's a common use case to test multiple version of the same operating system. Here's a simple example to get your started. This is more rspec-related that Fauxhai related, but here ya go:

```ruby
require 'chefspec'

describe 'awesome_cookbook::default' do
  ['18.04', '20.04'].each do |version|
    context "on Ubuntu #{version}" do
      before do
        Fauxhai.mock(platform: 'ubuntu', version: version)
      end

      it 'should install awesome' do
        @runner = ChefSpec::ChefRunner.new.converge('tmpreaper::default')
        expect(@runner).to install_package 'awesome'
      end
    end
  end
end
```

## Contributing

See [CONTRIBUTING.md](https://github.com/chef/fauxhai/blob/master/CONTRIBUTING.md).
