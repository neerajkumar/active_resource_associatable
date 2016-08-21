class User < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_many_activeresources :books
  has_many_through_activeresources :friends, through: :friendships
end

class Reader < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_many_activeresources :studying_materials, class_name: "Book"

end

class Book < ActiveRecord::Base
  include ActiveResourceAssociatable

  belongs_to_activeresource :user
  belongs_to_activeresource :reader
end

class Account < ActiveRecord::Base
  include ActiveResourceAssociatable

  has_one_activeresource :user

end

class Image < ActiveRecord::Base
  include ActiveResourceAssociatable

  has_and_belongs_to_many_activeresources :users
end

class Friend < ActiveRecord::Base

  include ActiveResourceAssociatable

  has_many_through_activeresources :users, through: :friendships
end

class Friendship < ActiveRecord::Base
  include ActiveResourceAssociatable
  
  belongs_to_activeresource :user
  belongs_to :friend
end
