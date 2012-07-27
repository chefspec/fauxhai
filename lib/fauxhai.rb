module Fauxhai
  require 'fauxhai/exception'
  require 'fauxhai/fetcher'
  require 'fauxhai/mocker'

  def self.root
    @@root ||= File.expand_path('../../', __FILE__)
  end

  def self.mock(*args)
    Fauxhai::Mocker.new(*args)
  end

  def self.fetch(*args)
    Fauxhai::Fetcher.new(*args)
  end
end
