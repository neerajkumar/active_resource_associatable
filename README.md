# ActiveResourceAssociatable

This gem is used to establish the association between your ActiveResource class to ActiveRecord class. Why? Because there is no other ruby library to provide such functionality. Its simple and taking care of all options, scopes etc with your associations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_resource_associatable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_resource_associatable

## Usage

```include ActiveResourceAssociatable``` in your ActiveRecord or ActiveResource model. Build the association by using command has_many_activeresources, belongs_to_active_resource etc.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_resource_associatable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

