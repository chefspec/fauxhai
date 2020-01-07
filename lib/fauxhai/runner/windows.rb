module Fauxhai
  class Runner
    module Windows
      require_relative 'default'
      include ::Fauxhai::Runner::Default

      def default_interface
        '0xe'
      end

      def network
        {
          'interfaces' => {
            "#{default_interface}" => {
              'configuration' => {
                'caption' => '[00000012] Ethernet Adapter',
                'database_path' => '%SystemRoot%\\System32\\drivers\\etc',
                'default_ip_gateway' => %w(default_gateway),
                'description' => 'Ethernet Adapter',
                'dhcp_enabled' => false,
                'dns_domain_suffix_search_order' => [],
                'dns_enabled_for_wins_resolution' => false,
                'dns_host_name' => hostname,
                'domain_dns_registration_enabled' => false,
                'full_dns_registration_enabled' => true,
                'gateway_cost_metric' => [0],
                'index' => 12,
                'interface_index' => 14,
                'ip_address' => [ipaddress],
                'ip_connection_metric' => 5,
                'ip_enabled' => true,
                'ip_filter_security_enabled' => false,
                'ip_sec_permit_ip_protocols' => [],
                'ip_sec_permit_tcp_ports' => [],
                'ip_sec_permit_udp_ports' => [],
                'ip_subnet' => %w(255.255.255.0 64),
                'mac_address' => macaddress,
                'service_name' => 'netkvm',
                'setting_id' => '{00000000-0000-0000-0000-000000000000}',
                'tcpip_netbios_options' => 0,
                'tcp_window_size' => 64240,
                'wins_enable_lm_hosts_lookup' => true,
                'wins_scope_id' => '',
              },
              'instance' => {
                'adapter_type' => 'Ethernet 802.3',
                'adapter_type_id' => 0,
                'availability' => 3,
                'caption' => '[00000012] Ethernet Adapter',
                'config_manager_error_code' => 0,
                'config_manager_user_config' => false,
                'creation_class_name' => 'Win32_NetworkAdapter',
                'description' => 'Ethernet Adapter',
                'device_id' => '12',
                'guid' => '{00000000-0000-0000-0000-000000000000}',
                'index' => 12,
                'installed' => true,
                'interface_index' => 14,
                'mac_address' => macaddress,
                'manufacturer' => '',
                'max_number_controlled' => 0,
                'name' => 'Ethernet Adapter',
                'net_connection_id' => 'Ethernet',
                'net_connection_status' => 2,
                'net_enabled' => true,
                'physical_adapter' => true,
                'pnp_device_id' => 'PCI\\VEN_0000&DEV_0000&SUBSYS_000000000&REV_00\\0&0000000000&00',
                'power_management_supported' => false,
                'product_name' => 'Ethernet Adapter',
                'service_name' => 'netkvm',
                'speed' => '10000000000',
                'system_creation_class_name' => 'Win32_ComputerSystem',
                'system_name' => hostname,
                'time_of_last_reset' => '20000101000001.000000+000'
              },
              'counters' => {},
              'addresses' => {
                "#{ipaddress}" => {
                  'prefixlen' => '24',
                  'netmask' => '255.255.255.0',
                  'broadcast' => '10.0.0.255',
                  'family' => 'inet'
                },
                "#{macaddress}" => {
                  'family' => 'lladdr'
                }
              },
              'type' => 'Ethernet 802.3',
              'arp' => {
                '10.0.0.1' => 'fe:ff:ff:ff:ff:ff'
              },
              'encapsulation' => 'Ethernet'
            }
          },
          'default_gateway' => default_gateway,
          'default_interface' => default_interface
        }
      end
    end
  end
end
