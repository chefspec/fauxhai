module Fauxhai
  module Exception
    class InvalidVersion < ArgumentError; end
    class InvalidPlatform < ArgumentError; end

    class NoDefaultVersion < StandardError; end
  end
end
