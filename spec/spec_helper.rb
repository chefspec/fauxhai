require "rspec"
require "rspec/its"
require "fauxhai"

RSpec.configure do |config|
  # Basic configuraiton
  config.run_all_when_everything_filtered = true
  config.filter_run(:focus)
  config.add_formatter("documentation")

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  config.seed = ENV["SEED"].to_i if ENV["SEED"]

  # Enable full backtrace if $DEBUG is set.
  config.full_backtrace = true if ENV["DEBUG"]
end
