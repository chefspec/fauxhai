module Fauxhai
  autoload :Exception, "fauxhai/exception"
  autoload :Fetcher, "fauxhai/fetcher"
  autoload :Mocker, "fauxhai/mocker"
  autoload :VERSION, "fauxhai/version"

  def self.root
    @@root ||= File.expand_path("../../", __FILE__)
  end

  def self.mock(*args, &block)
    Fauxhai::Mocker.new(*args, &block)
  end

  def self.fetch(*args, &block)
    Fauxhai::Fetcher.new(*args, &block)
  end
end
