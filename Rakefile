#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'json'

task :default => ['validate:json']

namespace :validate do
  desc 'Validate mock platform data is valid JSON'
  task :json do
    failure = false
    Dir.glob('./lib/fauxhai/platforms/**/*.json') do |file|
      begin
        JSON.parse(File.read(file))
      rescue JSON::ParserError => e
        failure = true
        puts "Failed to parse #{file}."
      end
    end
    exit! if failure
    puts 'JSON files validated'
  end
end
