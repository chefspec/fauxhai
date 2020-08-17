#!/usr/bin/env rake
require "bundler/gem_tasks"
require "json"

task default: ["validate:json", "spec"]

namespace :validate do
  desc "Validate mock platform data is valid JSON"
  task :json do
    failure = false
    Dir.glob("./lib/fauxhai/platforms/**/*.json") do |file|
      begin
        JSON.parse(File.read(file))
      rescue JSON::ParserError
        failure = true
        puts "Failed to parse #{file}."
      end
    end
    exit! if failure
    puts "JSON files validated"
  end
end

namespace :documentation do
  desc "Update the PLATFORMS.md file with a list of all platforms"
  task update_platforms: :update_json_list do
    File.delete("PLATFORMS.md") if File.exist?("PLATFORMS.md")
    f = File.new("PLATFORMS.md", "w")
    f.write "## Fauxhai Platforms\n\nThis file lists each platform known to Fauxhai and the available versions for each of those platforms. See the ChefSpec documentation for mocking out platforms and platform versions within ChefSpec.\n"

    JSON.parse(File.read("platforms.json")).each do |plat, versions|
      f.write "\n### #{plat}\n\n"
      versions.each { |ver, data| f.write "- #{ver}#{" (deprecated)" if data["deprecated"]}\n" }
    end
    f.close
  end
end

desc "Update the platforms.json data file used when a platform can't be found locally"
task :update_json_list do
  # get a sorted list of platforms from files in the platforms dir
  # but skip any hidden files and skip the fake chefspec platform
  plats = Dir.children("./lib/fauxhai/platforms/").sort
    .select { |v| !v.match?(/(^\.|chefspec)/) }
    .to_h { |v| [v, {}] }

  # add version, deprecated status, and file path to each platform
  plats.each_key do |plat|
    ver_data = Dir.glob(File.join("lib/fauxhai/platforms/", plat, "**.json"))

    # we can't properly sort windows versions
    # but this is a quick and dirty sort that's better than nothing
    ver_data = if plat == "windows"
                 ver_data.sort
               else
                 ver_data.sort_by { |x| Gem::Version.new(File.basename(x, ".json")) }
               end

    ver_data.each do |version_path|
      data = JSON.parse(File.read(version_path))
      ver = File.basename(version_path, ".json")
      plats[plat][ver] = {}
      plats[plat][ver]["deprecated"] = !!data["deprecated"]
      plats[plat][ver]["path"] = version_path
    end
  end

  File.open("platforms.json", "w") do |f|
    f.write(JSON.pretty_generate(plats))
  end
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)
