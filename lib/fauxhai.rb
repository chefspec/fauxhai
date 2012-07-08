module Fauxhai
  require 'fauxhai/exception'
  require 'fauxhai/mock'

  def self.root
    @@root ||= File.expand_path('../../', __FILE__)
  end
end
