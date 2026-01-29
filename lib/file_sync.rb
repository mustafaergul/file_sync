# frozen_string_literal: true

require "fileutils"
require "yaml"

# Functionality of syncing specific files
module FileSync
  class Error < StandardError; end

  # Class to manage files
  class MyConfig
    attr_accessor :f_name

    def initialize(f_name)
      @f_name = f_name
      @dot_dir = Dir.pwd
    end

    def fetch
      puts "Fetching files..."
      @f_name.each_with_index { |file, index| puts "#{index + 1}. File: #{file}" }
      puts
    end

    def compare
      puts "Comparing files..."
      @f_name.each do |file|
        # Strip trailing slashes to handle directories correctly
        clean_file = file.chomp("/")
        source = File.expand_path("~/#{clean_file}")
        destination = File.join(@dot_dir, clean_file)

        if File.exist?(source)
          if File.exist?(destination) && files_identical?(source, destination)
            puts "#{clean_file} is already up to date!"
          else
            sync(clean_file, source, destination)
          end
        else
          puts "Source file #{source} does not exist!"
        end
      end
    end

    def sync(file, source, destination)
      puts "Syncing #{file}..."
      FileUtils.mkdir_p(File.dirname(destination))
      FileUtils.cp_r(source, destination)
      puts "#{file} has been synced!"
      puts
    end

    private

    def files_identical?(source, destination)
      return false unless File.exist?(source) && File.exist?(destination)

      if File.directory?(source) && File.directory?(destination)
        true
      elsif File.file?(source) && File.file?(destination)
        FileUtils.identical?(source, destination)
      else
        false
      end
    end
  end
end

# Run the sync if this file is executed directly
if __FILE__ == $0
  require "yaml"

  config_path = File.expand_path("../../config/filenames.yml", __FILE__)
  config = YAML.load_file(config_path)

  sync = FileSync::MyConfig.new(config["filenames"])
  sync.compare
end
