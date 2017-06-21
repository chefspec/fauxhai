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

namespace :documentation do
  desc 'Update the PLATFORMS.md file with a list of all platforms'
  task :update_platforms do
    File.delete('PLATFORMS.md') if File.exist?('PLATFORMS.md')
    f = File.new('PLATFORMS.md', 'w')
    f.write "## Fauxhai Platforms\n\nThis file lists each platform known to Fauxhai and the available versions for each of those platforms. See the ChefSpec documentation for mocking out platforms and platform versions within ChefSpec.\n"
    Dir.glob('./lib/fauxhai/platforms/**') do |platform_path|
      versions = []
      Dir.glob(File.join(platform_path, '**.json')).each do |version_path|
        # skip anything marked as deprecated
        data = JSON.parse(File.read(version_path))
        unless data['deprecated']
          versions << version_path.split('/')[-1].chomp('.json')
        end
      end
      # make sure there are any non-deprecated platforms before writing out the header
      unless versions.empty?
        f.write "\n### #{platform_path.split('/')[-1]}\n\n"
        versions.each do |v|
          f.write "  - #{v}\n"
        end
      end
    end
    f.close
  end
end
