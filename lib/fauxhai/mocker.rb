require 'json'
require 'pathname'
require 'open-uri'

module Fauxhai
  class Mocker
    # The base URL for the GitHub project (raw)
    RAW_BASE = 'https://raw.githubusercontent.com/chefspec/fauxhai/master'.freeze

    # A message about where to find a list of platforms
    PLATFORM_LIST_MESSAGE = 'A list of available platforms is available at https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md'.freeze

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
    # @option options [Bool] :github_fetching
    #   whether to try loading from Github
    def initialize(options = {}, &override_attributes)
      @options = { github_fetching: true }.merge(options)

      @data = fauxhai_data
      yield(@data) if block_given?

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
          parse_and_validate(File.read(filepath))
        elsif @options[:github_fetching]
          # Try loading from github (in case someone submitted a PR with a new file, but we haven't
          # yet updated the gem version). Cache the response locally so it's faster next time.
          begin
            response = open("#{RAW_BASE}/lib/fauxhai/platforms/#{platform}/#{version}.json")
          rescue OpenURI::HTTPError
            raise Fauxhai::Exception::InvalidPlatform.new("Could not find platform '#{platform}/#{version}' on the local disk and an HTTP error was encountered when fetching from Github. #{PLATFORM_LIST_MESSAGE}")
          end

          if response.status.first.to_i == 200
            response_body = response.read
            path = Pathname.new(filepath)
            FileUtils.mkdir_p(path.dirname)

            begin
              File.open(filepath, 'w') { |f| f.write(response_body) }
            rescue Errno::EACCES # a pretty common problem in CI systems
              raise Fauxhai::Exception::InvalidPlatform.new("Fetched '#{platform}/#{version}' from Github, but could could not write the to the local path: #{filepath}")
            end
            return parse_and_validate(response_body)
          else
            raise Fauxhai::Exception::InvalidPlatform.new("Could not find platform '#{platform}/#{version}' on the local disk and an Github fetching returned http error code #{response.status.first.to_i}! #{PLATFORM_LIST_MESSAGE}")
          end
        else
          raise Fauxhai::Exception::InvalidPlatform.new("Could not find platform '#{platform}/#{version}' on the local disk and Github fetching is disabled! #{PLATFORM_LIST_MESSAGE}")
        end
      end.call
    end

    # As major releases of Ohai ship it's difficult and sometimes impossible
    # to regenerate all fauxhai data. This allows us to deprecate old releases
    # and eventually remove them while giving end users ample warning.
    def parse_and_validate(unparsed_data)
      parsed_data = JSON.parse(unparsed_data)
      if parsed_data['deprecated']
        STDERR.puts "WARNING: Fauxhai platform data for #{parsed_data['platform']} #{parsed_data['platform_version']} is deprecated and will be removed in the 6.0 release 3/2018. #{PLATFORM_LIST_MESSAGE}"
      end
      parsed_data
    end

    def platform
      @options[:platform] ||= begin
                                STDERR.puts "WARNING: you must specify a 'platform' and 'version' to your ChefSpec Runner and/or Fauxhai constructor, in the future omitting these will become a hard error. #{PLATFORM_LIST_MESSAGE}"
                                'chefspec'
                              end
    end

    def platform_path
      File.join(Fauxhai.root, 'lib', 'fauxhai', 'platforms', platform)
    end

    def version
      @options[:version] ||= chefspec_version || raise(Fauxhai::Exception::InvalidVersion.new("Platform version not specified. #{PLATFORM_LIST_MESSAGE}"))
    end

    def chefspec_version
      platform == 'chefspec' ? '0.6.1' : nil
    end
  end
end
