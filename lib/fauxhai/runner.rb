require 'ohai'
require 'ohai/plugins/chef'

module Fauxhai
  class Runner
    def initialize(args)
      @system = Ohai::System.new
      @system.all_plugins

      result = @system.data.dup.delete_if { |k, v| !whitelist_attributes.include?(k) }.merge(
        'languages' => languages,
        'chef_packages' => chef_packages,
        'counters' => counters,
        'current_user' => current_user,
        'domain' => domain,
        'etc' => etc,
        'hostname' => hostname,
        'fqdn' => fqdn,
        'ipaddress' => ipaddress,
        'keys' => keys,
        'macaddress' => macaddress,
        'network' => network,
        'uptime' => uptime,
        'uptime_seconds' => uptime_seconds,
        'cpu' => cpu,
        'memory' => memory,
        'virtualization' => virtualization
      )

      puts JSON.pretty_generate(result)
    end

    private

    def bin_dir
      '/usr/local/bin'
    end

    def chef_packages
      return {} if @system.data['chef_packages'].nil?

      chef_version = @system.data['chef_packages']['chef']['version']
      ohai_version = @system.data['chef_packages']['ohai']['version']

      {
        'chef' => {
          'version' => chef_version,
          'chef_root' => ['/opt/chef/embedded/lib/ruby/gems/2.1.0/gems', "chef-#{chef_version}", 'lib'].join('/')
        },
        'ohai' => {
          'version' => ohai_version,
          'ohai_root' => ['/opt/chef/embedded/lib/ruby/gems/2.1.0/gems', "ohai-#{ohai_version}", 'lib', 'ohai'].join('/')
        }
      }
    end

    def counters
      {
        'network' => {
          'interfaces' => {
            'eth0' => {
              'rx' => {
                'bytes' => '0',
                'packets' => '0',
                'errors' => '0',
                'drop' => 0,
                'overrun' => 0,
                'frame' => 0,
                'compressed' => 0,
                'multicast' => 0
              },
              'tx' => {
                'bytes' => '342',
                'packets' => '0',
                'errors' => '0',
                'drop' => 0,
                'overrun' => 0,
                'collisions' => '0',
                'carrier' => 0,
                'compressed' => 0
              }
            }
          }
        }
      }
    end

    def current_user
      'fauxhai'
    end

    def default_gateway
      '10.0.0.1'
    end

    def default_interface
      'eth0'
    end

    def domain
      'local'
    end

    def etc
      {
        'passwd' => {
          'fauxhai' => {
            'dir' => '/home/fauxhai',
            'gid' => 0,
            'uid' => 0,
            'shell' => '/bin/bash',
            'gecos' => 'Fauxhai'
          }
        },
        'group' => {
          'fauxhai' => {
            'gid' => 0,
            'members' => [
              'fauxhai'
            ]
          }
        }
      }
    end

    def fqdn
      'fauxhai.local'
    end

    def gem_bin
      '/usr/local/bin/gem'
    end

    def gems_dir
      '/usr/local/gems'
    end

    def hostname
      'Fauxhai'
    end

    def ipaddress
      '10.0.0.2'
    end

    def ip6address
      'fe80:0:0:0:0:0:a00:2'
    end

    def keys
      {
        'ssh' => ssh
      }
    end

    def languages
      {
        'ruby' => @system.data['languages']['ruby'].merge('bin_dir' => bin_dir,
                                                          'gem_bin' => gem_bin,
                                                          'gems_dir' => gems_dir,
                                                          'ruby_bin' => ruby_bin),
        'powershell' => @system.data['languages']['powershell']
      }
    end

    def macaddress
      '11:11:11:11:11:11'
    end

    def network
      {
        'default_gateway' => default_gateway,
        'default_interface' => default_interface,
        'settings' => {},
        'interfaces' => {
          'eth0' => {
            'addresses' => {
              '10.0.0.2' => {
                'broadcast' => '10.0.0.255',
                'family' => 'inet',
                'netmask' => '255.255.255.0',
                'prefixlen' => '23',
                'scope' => 'Global'
              }
            },
            'arp' => {
              '10.0.0.1' => 'fe:ff:ff:ff:ff:ff'
            },
            'encapsulation' => 'Ethernet',
            'flags' => %w(BROADCAST MULTICAST UP LOWER_UP),
            'mtu' => '1500',
            'number' => '0',
            'routes' => {
              '10.0.0.0/255' => {
                'scope' => 'link',
                'src' => '10.0.0.2'
              }
            },
            'state' => 'up',
            'type' => 'eth'
          }
        }
      }
    end

    def ruby_bin
      '/usr/local/bin/ruby'
    end

    def ssh
      {
        'host_dsa_public' => File.read( File.join(Fauxhai.root, 'lib', 'fauxhai', 'keys', 'id_dsa.pub') ).strip,
        'host_rsa_public' => File.read( File.join(Fauxhai.root, 'lib', 'fauxhai', 'keys', 'id_rsa.pub') ).strip
      }
    end

    def uptime
      '30 days 15 hours 07 minutes 30 seconds'
    end

    def uptime_seconds
      2646450
    end

    def cpu
      {
        'real' => 1,
        'total' => 1,
        'cores' => 1
      }
    end

    def memory
      {
        'total' => '1048576kB'
      }
    end

    def virtualization
      {
        'systems' => {}
      }
    end

    # Whitelist attributes are attributes that we *actually* want from the node. Other attributes are
    # either ignored or overridden, but we ensure these are returned with the command.
    #
    # @return [Array] - the key of whitelisted attributes
    def whitelist_attributes
      %w(
        command
        dmi
        filesystem
        kernel
        lsb
        ohai_time
        os
        os_version
        platform
        platform_version
        platform_build
        platform_family
        init_package
        root_group)
    end
  end
end
