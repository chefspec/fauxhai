module Fauxhai
  class Runner
    module Default
      def bin_dir
        '/usr/local/bin'
      end

      def counters
        {
          'network' => {
            'interfaces' => {
              'lo' => {
                'tx' => {
                  'queuelen' => '1',
                  'bytes' =>  0,
                  'packets' =>  0,
                  'errors' =>  0,
                  'drop' =>  0,
                  'carrier' => 0,
                  'collisions' => 0,
                },
                'rx' =>  {
                  'bytes' => 0,
                  'packets' => 0,
                  'errors' => 0,
                  'drop' => 0,
                  'overrun' => 0,
                },
              },
              default_interface.to_s => {
                'rx' => {
                  'bytes' => 0,
                  'packets' => 0,
                  'errors' => 0,
                  'drop' => 0,
                  'overrun' => 0,
                  'frame' => 0,
                  'compressed' => 0,
                  'multicast' => 0,
                },
                'tx' => {
                  'bytes' => 0,
                  'packets' => 0,
                  'errors' => 0,
                  'drop' => 0,
                  'overrun' => 0,
                  'collisions' => 0,
                  'carrier' => 0,
                  'compressed' => 0,
                },
              },
            },
          },
        }
      end

      def current_user
        'fauxhai'
      end

      def default_gateway
        '10.0.0.1'
      end

      def default_interface
        case @system.data['platform_family']
        when 'mac_os_x'
          'en0'
        when /bsd/
          'em0'
        when 'arch', 'fedora'
          'enp0s3'
        else
          'eth0'
        end
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
              'gecos' => 'Fauxhai',
            },
          },
          'group' => {
            'fauxhai' => {
              'gid' => 0,
              'members' => [
                'fauxhai',
              ],
            },
          },
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
          'ssh' => ssh,
        }
      end

      def languages
        {
          'ruby' => @system.data['languages']['ruby'].merge('bin_dir' => bin_dir,
                                                            'gem_bin' => gem_bin,
                                                            'gems_dir' => gems_dir,
                                                            'ruby_bin' => ruby_bin),
          'powershell' => @system.data['languages']['powershell'],
        }
      end

      def macaddress
        '11:11:11:11:11:11'
      end

      def network
        {
          'interfaces' => {
            'lo' => {
              'mtu' => '65536',
              'flags' => %w(LOOPBACK UP LOWER_UP),
              'encapsulation' => 'Loopback',
              'addresses' => {
                '127.0.0.1' => {
                  'family' => 'inet',
                  'prefixlen' => '8',
                  'netmask' => '255.0.0.0',
                  'scope' => 'Node',
                  'ip_scope' => 'LOOPBACK',
                },
                '::1' => {
                  'family' => 'inet6',
                  'prefixlen' => '128',
                  'scope' => 'Node',
                  'tags' => [],
                  'ip_scope' => 'LINK LOCAL LOOPBACK',
                },
              },
              'state' => 'unknown',
            },
            default_interface.to_s => {
              'type' => default_interface.chop,
              'number' => '0',
              'mtu' => '1500',
              'flags' => %w(BROADCAST MULTICAST UP LOWER_UP),
              'encapsulation' => 'Ethernet',
              'addresses' => {
                macaddress.to_s => {
                  'family' => 'lladdr',
                },
                ipaddress.to_s => {
                  'family' => 'inet',
                  'prefixlen' => '24',
                  'netmask' => '255.255.255.0',
                  'broadcast' => '10.0.0.255',
                  'scope' => 'Global',
                  'ip_scope' => 'RFC1918 PRIVATE',
                },
                'fe80::11:1111:1111:1111' => {
                  'family' => 'inet6',
                  'prefixlen' => '64',
                  'scope' => 'Link',
                  'tags' => [],
                  'ip_scope' => 'LINK LOCAL UNICAST',
                },
              },
              'state' => 'up',
              'arp' => {
                '10.0.0.1' => 'fe:ff:ff:ff:ff:ff',
              },
              'routes' => [
                {
                  'destination' => 'default',
                  'family' => 'inet',
                  'via' => default_gateway,
                },
                {
                  'destination' => '10.0.0.0/24',
                  'family' => 'inet',
                  'scope' => 'link',
                  'proto' => 'kernel',
                  'src' => ipaddress,
                },
                {
                  'destination' => 'fe80::/64',
                  'family' => 'inet6',
                  'metric' => '256',
                  'proto' => 'kernel',
                },
              ],
              'ring_params' => {},
            },
          },
          'default_interface' => default_interface,
          'default_gateway' => default_gateway,
        }
      end

      def ruby_bin
        '/usr/local/bin/ruby'
      end

      def ssh
        {
          'host_dsa_public' => File.read(File.join(Fauxhai.root, 'lib', 'fauxhai', 'keys', 'id_dsa.pub')).strip,
          'host_rsa_public' => File.read(File.join(Fauxhai.root, 'lib', 'fauxhai', 'keys', 'id_rsa.pub')).strip,
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
          'cores' => 1,
        }
      end

      def memory
        {
          'total' => '1048576kB',
        }
      end

      def virtualization
        {
          'systems' => {},
        }
      end

      def time
        {
          'timezone' => 'GMT',
        }
      end

      # Whitelist attributes are attributes that we *actually* want from the node. Other attributes are
      # either ignored or overridden, but we ensure these are returned with the command.
      #
      # @return [Array] - the key of whitelisted attributes
      def whitelist_attributes
        %w(
          block_device
          chef_packages
          command
          dmi
          filesystem
          fips
          init_package
          kernel
          lsb
          ohai_time
          os
          os_version
          packages
          platform
          platform_version
          platform_build
          platform_family
          root_group
          shard_seed
          shells
        )
      end
    end
  end
end
