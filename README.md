# Rspec::Formatter::GitAutoCommit

Commits your code automatically Every time run RSpec (if file changed).

Git log example:
```
efc829c [green] 101 examples, 0 failures in 9.66 seconds
8ccd44a [red] 79 examples, 61 failures in 19.02 seconds
6b2d17a [green] 79 examples, 0 failures in 33.43 seconds
```

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-formatter-git_auto_commit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-formatter-git_auto_commit

## Usage

```sh
rspec --format RSpec::Formatter::GitAutoCommit spec
```

or

write .rspec.
```
--format d
--format RSpec::Formatter::GitAutoCommit
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
