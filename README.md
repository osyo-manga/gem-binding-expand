# Binding::Expand

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'binding-expand'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install binding-expand

## Usage

```ruby
def meth
  "meth"
end

hoge = 42
foo = "homu"
bar = [1, 2, 3]
binding.expand(:hoge, :foo, :bar, :meth) # => { hoge: hoge, foo: foo, bar: bar, meth: meth }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/osyo-manga/gem-binding-expand.
