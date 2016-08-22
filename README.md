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

  has_one_activeresource :account
end
```

```ruby
class Account < ActiveRecord::Base
  include ActiveResourceAssociatable

  belongs_to_activeresource :reader
end
```

### Belongs To ActiveResource
The same example which explained above in Has One ActiveResource section could be an example of belongs_to_activeresource.
```belongs_to_activeresource``` can also be applied in case of ```has_many_activeresources`` associations.

### Has Many ActiveResources
User is ActiveResource class which maintains the has many relationships with non ActiveResource class Book.

```ruby
class User < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_many_activeresources :books
end
```
```ruby
class Book < ActiveRecord::Base
  include ActiveResourceAssociatable

  belongs_to_activeresource :user
end
```
Now you can easily call ```user.books``` which will return the array of objects of non ActiveResource class Book.

```has_many_activeresources``` also comes with options ```class_name```.

```ruby
class Reader < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_many_activeresources :studying_materials, class_name: "Book"
end
```
```ruby
class Book < ActiveRecord::Base
  include ActiveResourceAssociatable

  belongs_to_activeresource :reader
end
```
Now you can call ```reader.studying_materials``` which will return the array of objects of non ActiveResource class Book.

### Has And Belongs To Many ActiveResources
```active_resource_associatable``` provides many to many associations between ActiveResource and ActiveRecord. 
User class is a ActiveResource class and can have many images. Likewise, Image which is a ActiveRecord class can have many users.

```ruby
class User < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_and_belongs_to_many_activeresources :images
end
```
```ruby
class Image < ActiveRecord::Base
  include ActiveResourceAssociatable

  has_and_belongs_to_many_activeresources :users
end
```

### Has Many Through ActiveResources
``has_many_through_activeresources``` can also be achieved using ```active_resource_associatable```. User can have many friends through friendships. Similarly, a friend can also have many users through friendships.

```ruby
class User < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_many_through_activeresources :friends, through: :friendships
end
```
```ruby
class Friend < ActiveRecord::Base

  include ActiveResourceAssociatable

  has_many_through_activeresources :users, through: :friendships
end
```
```ruby
class Friendship < ActiveRecord::Base
  include ActiveResourceAssociatable
  
  belongs_to_activeresource :user
  belongs_to :friend
end
```
 
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_resource_associatable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

