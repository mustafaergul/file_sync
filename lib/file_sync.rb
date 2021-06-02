#!/usr/bin/ruby
# frozen_string_literal: true

# Script that will sync configuration files.

require 'fileutils'

module FileSync
  class Error < StandardError; end

  # Class to detect files and sync them.
  class File
    attr_accessor :fname

    def initialize(*fname)
      @fname = fname
      @dot_dir = %(dotfiles/)
    end

    def fetch
      p 'Fetching files...'
      @fname.each_with_index { |fname, index| p "#{index + 1}.file: #{fname}" }
    end

    def compare
      p 'Comparing files....'
      @fname.each do |file|
        if FileUtils.identical?("#{ENV['HOME']}/Projects/#{@dot_dir}#{file}", "#{ENV['HOME']}/#{file}")
          p "#{file} is already up to date!"
        else
          sync(file)
        end
      end
    end

    def sync(file)
      p "#{file} is syncing..."
      cmd = "cp ~/#{file} #{ENV['HOME']}/Projects/#{@dot_dir}"
      output = `#{cmd}`
    end

    fo = File.new('.vimrc', '.zshrc', '.tmux.conf')
    fo.fetch
    fo.compare
  end
end
