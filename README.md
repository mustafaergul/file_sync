# FileSync

This is small Ruby script that is aim to sync your configuration files from your local machine to any the repository that you are managing your dotfiles or any other repository that you would like to use.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'file_sync'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install file_sync

## Usage

You can simply run the file under `lib/file_sync.rb`.

As a default file location, script will be using your \$HOME directory to find the files and compare the ones that you will be edited on the line 18 on file_sync.rb. However you are free to make changes and edit as your needs.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/file_sync. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/file_sync/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FileSync project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/file_sync/blob/master/CODE_OF_CONDUCT.md).
