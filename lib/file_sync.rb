#!/usr/bin/env ruby
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
      @dot_dir = File.expand_path("~/Projects/dotfiles/")
    end

    def fetch
      puts "Fetching files..."
      @f_name.each_with_index { |file, index| puts "#{index + 1}. File: #{file}" }
      puts
    end

    def compare
      puts "Comparing files..."
      @f_name.each do |file|
        source = File.expand_path("~/#{file}")
        destination = File.join(@dot_dir, file)

        if File.exist?(source)
          if File.exist?(destination) && FileUtils.identical?(source, destination)
            puts "#{file} is already up to date!"
          else
            sync(file, source, destination)
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
  end
end
