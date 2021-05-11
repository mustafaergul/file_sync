#!/usr/bin/ruby
# frozen_string_literal: true

# Script that will sync configuration files.

require 'fileutils'

module FileSync
  class Error < StandardError; end

  # Class to detect files and sync them.
  class File
    def initialize(*fns)
      @fns = fns
    end

    def fetch
      p '==========================='
      p '......Fetching files.......'
      p '==========================='
      @fns.each_with_index { |fn, index| p "#{index + 1}.filename: #{fn}" }
      p '==========================='
    end

    def compare_sync
      p 'Comparing files, please wait..'
      p '==========================='
      puts

      dot_dir = %(../dotfiles/)

      @fns.each do |f|
        if FileUtils.identical?("#{dot_dir}#{f}", "#{ENV['HOME']}/#{f}")
          p "#{f} is already up to date, ignored."
        else
          p "#{f} is syncing..."
          cmd = "cp ~/#{f} ."
          output = `#{cmd}`
        end
      end
    end

    fns = File.new('.vimrc', '.zshrc', '.tmux.conf')
    fns.fetch
    fns.compare_sync
  end
end
