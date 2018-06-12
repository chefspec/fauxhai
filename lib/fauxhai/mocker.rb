require 'json'
require 'pathname'
require 'open-uri'

module Fauxhai
  class Mocker
    # The base URL for the GitHub project (raw)
    RAW_BASE = 'https://raw.githubusercontent.com/chefspec/fauxhai/master'.freeze

    # A message about where to find a list of platforms
    PLATFORM_LIST_MESSAGE = 'A list of available platforms is available at https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md'.freeze

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

      yield(data) if block_given?
    end

    def data
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
              puts "Fetched '#{platform}/#{version}' from GitHub, but could not write to the local path: #{filepath}. Fix the local file permissions to avoid downloading this file every run."
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

    private

    # As major releases of Ohai ship it's difficult and sometimes impossible
    # to regenerate all fauxhai data. This allows us to deprecate old releases
    # and eventually remove them while giving end users ample warning.
    def parse_and_validate(unparsed_data)
      parsed_data = JSON.parse(unparsed_data)
      if parsed_data['deprecated']
        STDERR.puts "WARNING: Fauxhai platform data for #{parsed_data['platform']} #{parsed_data['platform_version']} is deprecated and will be removed in the 7.0 release 3/2019. #{PLATFORM_LIST_MESSAGE}"
      end
      parsed_data
    end

    def platform
      @options[:platform] ||= begin
                                STDERR.puts "WARNING: you must specify a 'platform' and optionally a 'version' for your ChefSpec Runner and/or Fauxhai constructor, in the future omitting the platform will become a hard error. #{PLATFORM_LIST_MESSAGE}"
                                'chefspec'
                              end
    end

    def platform_path
      File.join(Fauxhai.root, 'lib', 'fauxhai', 'platforms', platform)
    end

    def version
      @version ||= begin
        if File.exist?("#{platform_path}/#{@options[:version]}.json")
          # Whole version, use it as-is.
          @options[:version]
        else
          # Check if it's a prefix of an existing version.
          versions = Dir["#{platform_path}/*.json"].map {|path| File.basename(path, '.json') }
          unless @options[:version].to_s == ''
            # If the provided version is nil or '', that means take anything,
            # otherwise run the prefix match with an extra \D to avoid the
            # case where "7.1" matches "7.10.0".
            prefix_re = /^#{Regexp.escape(@options[:version])}\D/
            versions.select! {|ver| ver =~ prefix_re }
          end

          if versions.empty?
            # No versions available, either an unknown platform or nothing matched
            # the prefix check. Pass through the option as given so we can try
            # github fetching.
            @options[:version]
          else
            # Take the highest version available, trying to use rules that should
            # probably mostly work on all OSes. Famous last words. The idea of
            # the regex is to split on any punctuation (the common case) and
            # also any single letter with digit on either side (2012r2). This
            # leaves any long runs of letters intact (4.2-RELEASE). Then convert
            # any run of digits to an integer to get version-ish comparison.
            # This is basically a more flexible version of Gem::Version.
            versions.max_by do |ver|
              ver.split(/[^a-z0-9]|(?<=\d)[a-z](?=\d)/i).map do |part|
                if part =~ /^\d+$/
                  part.to_i
                else
                  part
                end
              end
            end
          end
        end
      end
    end

  end
end
