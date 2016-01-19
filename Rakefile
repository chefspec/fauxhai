#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'json'

namespace :validate do 
  desc "Validate mock platform data is valid JSON"
  task :json do
    Dir.glob("./lib/fauxhai/platforms/**/*.json") do |file|
      begin
        JSON.parse(File.read(file))
      rescue JSON::ParserError => e
        puts "Failed to parse #{file}."
      end
    end
  end
end
