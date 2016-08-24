require 'json'
require 'pathname'
require 'open-uri'

module Fauxhai
  class Mocker
    # The base URL for the GitHub project (raw)
    RAW_BASE = 'https://raw.githubusercontent.com/customink/fauxhai/master'

    # @return [Hash] The raw ohai data for the given Mock
    attr_reader :data

    # Create a new Ohai Mock with fauxhai.
    #
    # @param [Hash] options
    #   the options for the mocker
    # @option options [String] :platform
    #   the platform to mock
    # @option options [String] :version
    #   the version of the platform to mock
    # @option options [String] :path
    #   the path to a local JSON file
    def initialize(options = {}, &override_attributes)
      @options = options

      @data = fauxhai_data
      yield(@data) if block_given?

      if defined?(::ChefSpec) && ::ChefSpec::VERSION <= '0.9.0'
        data = @data
        ::ChefSpec::ChefRunner.send :define_method, :fake_ohai do |ohai|
          data.each_pair do |attribute, value|
            ohai[attribute] = value
          end
        end
      end

      @data
    end

    private

    def fauxhai_data
      @fauxhai_data ||= lambda do
        # If a path option was specified, use it
        if @options[:path]
          filepath = File.expand_path(@options[:path])

          unless File.exist?(filepath)
            raise Fauxhai::Exception::InvalidPlatform.new("You specified a path to a JSON file on the local system that does not exist: '#{filepath}'")
          end
        else
          filepath = File.join(platform_path, "#{version}.json")
        end

        if File.exist?(filepath)
          JSON.parse( File.read(filepath) )
        elsif
          # Try loading from github (in case someone submitted a PR with a new file, but we haven't
          # yet updated the gem version). Cache the response locally so it's faster next time.
          begin
            response = open("#{RAW_BASE}/lib/fauxhai/platforms/#{platform}/#{version}.json")
          rescue OpenURI::HTTPError
            raise Fauxhai::Exception::InvalidPlatform.new("Could not find platform '#{platform}/#{version}' in any of the sources!")
          end

          if response.status.first.to_i == 200
            response_body = response.read
            path = Pathname.new(filepath)
            FileUtils.mkdir_p(path.dirname)

            File.open(filepath, 'w') { |f| f.write(response_body) }
            return JSON.parse(response_body)
          else
            raise Fauxhai::Exception::InvalidPlatform.new("Could not find platform '#{platform}/#{version}' in any of the sources!")
          end
        end
      end.call
    end

    def platform
      @options[:platform] ||= begin
                                STDERR.puts "WARNING: you must specify a platform and platform_version to your ChefSpec Runner and/or Fauxhai constructor, in the future omitting these will become a hard error"
                                'chefspec'
                              end
    end

    def platform_path
      File.join(Fauxhai.root, 'lib', 'fauxhai', 'platforms', platform)
    end

    def version
      @options[:version] ||= chefspec_version || raise(Fauxhai::Exception::InvalidVersion.new('Platform version not specified'))
    end

    def chefspec_version
      platform == 'chefspec' ? '0.6.1' : nil
    end
  end
end
