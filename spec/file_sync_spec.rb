require_relative '../lib/file_sync.rb'

RSpec.describe FileSync, "MyConfig#fname" do
  let(:including_class) { Class.new { include ::FileSync } }
    it "finds the file on the $HOME" do
      p including_class.inspect
      expect(including_class.new.fetch(".vimrc")).to eq ".vimrc is already up to date!"
  end
end
