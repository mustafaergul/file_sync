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
    end

    def fetch
      p 'Fetching files...'
      @fname.each_with_index { |fname, index| p "#{index + 1}.file: #{fname}" }
    end

    def compare_sync
      p 'Comparing files, please wait..'
      dot_dir = %(../dotfiles/)
      @fname.each do |f|
        if FileUtils.identical?("#{dot_dir}#{f}", "#{ENV['HOME']}/#{f}")
          p "#{f} is already up to date, ignored."
        else
          p "#{f} is syncing..."
          cmd = "cp ~/#{f} ."
          output = `#{cmd}`
        end
      end
    end

    fo = File.new('.vimrc', '.zshrc', '.tmux.conf')
    fo.fetch
    fo.compare_sync
  end
end
