require 'ohai'
require 'ohai/plugins/chef'

module Fauxhai
  class Runner
    def initialize(args)
      @system = Ohai::System.new
      @system.all_plugins

      case @system.data['platform']
      when 'windows', :windows
        require 'fauxhai/runner/windows'
        self.singleton_class.send :include, ::Fauxhai::Runner::Windows
      else
        require 'fauxhai/runner/default'
        self.singleton_class.send :include, ::Fauxhai::Runner::Default
      end

      result = @system.data.dup.delete_if { |k, v| !whitelist_attributes.include?(k) }.merge(
        'languages' => languages,
        'chef_packages' => chef_packages,
        'counters' => counters,
        'current_user' => current_user,
        'domain' => domain,
        'etc' => etc,
        'hostname' => hostname,
        'machinename' => hostname,
        'fqdn' => fqdn,
        'ipaddress' => ipaddress,
        'keys' => keys,
        'macaddress' => macaddress,
        'network' => network,
        'uptime' => uptime,
        'uptime_seconds' => uptime_seconds,
        'idle' => uptime,
        'idletime_seconds' => uptime_seconds,
        'cpu' => cpu,
        'memory' => memory,
        'virtualization' => virtualization,
        'time' => time
      )

      puts JSON.pretty_generate(result.sort.to_h)
    end
  end
end
