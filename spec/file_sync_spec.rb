# frozen_string_literal: true

require_relative '../lib/file_sync'

RSpec.describe FileSync, '#fname' do
  let(:including_class) { FileSync::MyConfig.new { include FileSync } }

  it 'testing existence of a file on the target destination' do
    file_names = ['.vimrc', '.zshrc', '.tmux.conf']
    file_names.flatten.map do |f|
      expect(File).to exist("#{ENV['HOME']}/#{f}")
    end
  end

  it 'testing existence of a file on the source destination' do
    file_names = ['.vimrc', '.zshrc', '.tmux.conf']
    file_names.flatten.map do |f|
      expect(File).to exist("#{ENV['HOME']}/Projects/dotfiles/#{f}")
  end
end
end
