#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'json'

task :default => ['validate:json', 'spec']

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
    Dir.glob('./lib/fauxhai/platforms/**').sort.each do |platform_path|
      next if platform_path.split('/')[-1] == 'chefspec'
      versions = []
      Dir.glob(File.join(platform_path, '**.json')).sort.each do |version_path|
        # skip anything marked as deprecated
        data = JSON.parse(File.read(version_path))
        unless data['deprecated']
          versions << version_path.split('/')[-1].chomp('.json')
        end
      end
      # make sure there are any non-deprecated platforms before writing out the header
      unless versions.empty?
        f.write "\n### #{platform_path.split('/')[-1]}\n\n"
        versions = versions.sort_by { |v| Gem::Version.new(v) } unless platform_path.split('/')[-1] == 'windows' # make sure we're sorted by version and not by strings
        versions.each do |v|
          f.write "  - #{v}\n"
        end
      end
    end
    f.close
  end
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
