# !/usr/bin/ruby
# frozen_string_literal: true

# Ruby script that will sync dotfiles configuration

require 'fileutils'
require 'yaml'

# Functionality of syncing specific files
module FileSync
  class Error < StandardError; end

  # Class to manage files
  class MyConfig
    attr_accessor :fname

    def initialize(fname)
      @fname = fname
      @dot_dir = %(dotfiles/)
    end

    def fetch
      puts 'Fetching files...'
      @fname.each_with_index { |fname, index| puts "#{index + 1}.file: #{fname}" }
      puts
    end

    def compare
      puts 'Comparing files....'
      @fname.each do |file|
        if FileUtils.identical?("#{ENV['HOME']}/Projects/#{@dot_dir}#{file}", "#{ENV['HOME']}/#{file}")
          puts "#{file} is already up to date!"
        else
          sync(file)
        end
      end
    end

    def sync(file)
      puts "#{file} is syncing..."
      `cp ~/#{file} #{ENV['HOME']}/Projects/#{@dot_dir}`
      puts
    end
  end

  files_payload = YAML.load_file('./config/filenames.yml')

  files = MyConfig.new(files_payload.values.flatten)
  files.fetch
  files.compare

end
