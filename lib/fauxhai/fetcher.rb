require "digest/sha1"
require "json" unless defined?(JSON)

module Fauxhai
  class Fetcher
    def initialize(options = {}, &override_attributes)
      @options = options

      if !force_cache_miss? && cached?
        @data = cache
      else
        require "net/ssh" unless defined?(Net::SSH)
        Net::SSH.start(host, user, @options) do |ssh|
          @data = JSON.parse(ssh.exec!("ohai"))
        end

        # cache this data so we do not have to SSH again
        File.open(cache_file, "w+") { |f| f.write(@data.to_json) }
      end

      yield(@data) if block_given?

      if defined?(ChefSpec)
        data = @data
        ::ChefSpec::Runner.send :define_method, :fake_ohai do |ohai|
          data.each_pair do |attribute, value|
            ohai[attribute] = value
          end
        end
      end

      @data
    end

    def cache
      @cache ||= JSON.parse(File.read(cache_file))
    end

    def cached?
      File.exist?(cache_file)
    end

    def cache_key
      Digest::SHA2.hexdigest("#{user}@#{host}")
    end

    def cache_file
      File.expand_path(File.join(Fauxhai.root, "tmp", cache_key))
    end

    def force_cache_miss?
      @force_cache_miss ||= @options.delete(:force_cache_miss) || false
    end

    # Return the given `@data` attribute as a Ruby hash instead of a JSON object
    #
    # @return [Hash] the `@data` represented as a Ruby hash
    def to_hash(*args)
      @data.to_hash(*args)
    end

    def to_s
      "#<Fauxhai::Fetcher @host=#{host}, @options=#{@options}>"
    end

    private

    def host
      @host ||= begin
        raise ArgumentError, ":host is a required option for Fauxhai.fetch" unless @options[:host]

        @options.delete(:host)
      end
    end

    def user
      @user ||= (@options.delete(:user) || ENV["USER"] || ENV["USERNAME"]).chomp
    end
  end
end
