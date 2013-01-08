require 'json'
require 'httparty'

module Fauxhai
  class Mocker
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
    def initialize(options = {}, &override_attributes)
      @options = options

      @data = fauxhai_data
      yield(@data) if block_given?

      if defined?(::ChefSpec) && ::ChefSpec::VERSION < '0.9.0'
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
    def default_version
      @default_version ||= lambda do
        default_filepath = File.join(platform_path, 'default.json')

        if File.exists?(default_filepath)
          JSON.parse( File.read(default_filepath) )['version']
        else
          filename = Dir["#{platform_path}/*.json"].sort.pop

          if filename
            filename.split('/').last.gsub(/\.json/, '')
          else
            raise Fauxhai::Exception::NoDefaultVersion.new('Could not detect default version!')
          end
        end
      end.call
    end

    def fauxhai_data
      @fauxhai_data ||= lambda do
        filepath = File.join(platform_path, "#{version}.json")

        if File.exists?(filepath)
          JSON.parse( File.read(filepath) )
        elsif
          # Try loading from github (in case someone submitted a PR with a new file, but we haven't
          # yet updated the gem version). Cache the response locally so it's faster next time.
          response = HTTParty.get("https://raw.github.com/customink/fauxhai/master/lib/fauxhai/platforms/#{platform}/#{version}.json")
          if response.code == 200
            File.open(filepath, 'w'){ |f| f.write(response.body) }
            return JSON.parse(response.body)
          else
            raise Fauxhai::Exception::InvalidVersion.new("Could not find version #{@options[:version]} in any of the sources!")
          end
        end
      end.call
    end

    def platform
      @options[:platform] ||= 'chefspec'
    end

    def platform_path
      @platform_path ||= lambda do
        if path = File.join(Fauxhai.root, 'lib', 'fauxhai', 'platforms', platform)
          path
        else
          raise Fauxhai::Exception::InvalidPlatform.new('Platform not found!')
        end
      end.call
    end

    def version
      @version ||= @options[:version] || default_version
    end
  end
end
