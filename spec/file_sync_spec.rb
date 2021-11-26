# frozen_string_literal: true

require_relative '../lib/file_sync'

RSpec.describe FileSync, '#fname' do
  let(:including_class) { FileSync::MyConfig.new { include FileSync } }
  it 'testing existence of a file' do
    file_names = ['.vimrc', '.zshrc', '.tmux.conf']
    file_names.flatten.map do |f|
      expect(File).to exist("#{ENV['HOME']}/#{f}")
    end
  end
end
