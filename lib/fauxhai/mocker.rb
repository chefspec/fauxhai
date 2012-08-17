require 'json'

module Fauxhai
  class Mocker
    def initialize(options = {}, &override_attributes)
      @options = options

      @data = fauxhai_data
      yield(@data) if block_given?

      if defined?(ChefSpec)
        data = @data
        ::ChefSpec::ChefRunner.send :define_method, :fake_ohai do |ohai|
          data.each_pair do |attribute, value|
            ohai[attribute] = value
          end
        end
      end

      @data
    end

    # Return the given `@data` attribute as a Ruby hash instead of a JSON object
    #
    # @return [Hash] the `@data` represented as a Ruby hash
    def to_hash(*args)
      @data.to_hash(*args)
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
        else
          raise Fauxhai::Exception::InvalidVersion.new("Could not find version #{@options[:version]} in any of the sources!")
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
