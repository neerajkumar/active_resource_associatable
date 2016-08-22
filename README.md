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

```include ActiveResourceAssociatable``` in your ActiveRecord or ActiveResource model. Now you can easily call the methods of either of your ActiveRecord or ActiveResource models. This gem facilitates you to call ActiveResource objects in the same way as you call in any of your ActiveRecord model. It supports calls ```has_one_activeresource```, ```belongs_to_activeresource```, ```has_many_activeresources```, ```has_and_belongs_to_many_activeresources``` and ```has_many_through_activeresources```.

### Has One ActiveResource
Account is non ActiveResource class which is maintaining has one relationship with ActiveRecord class User. 

```ruby
class User < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  belongs_to_activeresource :account
end
```
```ruby
class Account < ActiveRecord::Base
  include ActiveResourceAssociatable

  has_one_activeresource :user
end
```

Whereas Reader is a ActiveResource class, but maintaining has one relationship with Account.

```ruby
class Reader < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_many_activeresources :studying_materials, class_name: "Book"
  belongs_to_activeresource :library
  has_one_activeresource :account
end
```

```ruby
class Account < ActiveRecord::Base
  include ActiveResourceAssociatable

  belongs_to_activeresource :reader
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_resource_associatable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

