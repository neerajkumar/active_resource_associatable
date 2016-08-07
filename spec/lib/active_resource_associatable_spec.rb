require_relative "./../spec_helper"

class User < ActiveResource::Base
  self.site = ""

  include ActiveResourceAssociatable

  has_many_activeresources :books

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

describe ActiveResourceAssociatable do

  before(:all) do
    @user = FactoryGirl.build(:user)
    Book.delete_all
    @book1 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
    @book2 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
    book3 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
    book4 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
  end
  
  it "should return many books for has_many_activeresources association without class name" do
    User.stub :find, @user do 
      user = User.find(1)

      user.firstname.must_equal "Neeraj"
      user.lastname.must_equal "Kumar"
      user.username.must_equal "neeraj"
      user.email.must_equal "neeraj.kumar@gmail.com"

      user.books.size.must_equal 4
      user.books.first.title.must_equal @book1.title
      user.books.second.title.must_equal @book2.title
    end
  end

  it "should return many books for has_many_activeresources association with class name" do
    reader = FactoryGirl.build(:reader)
    Reader.stub :find, reader do 
      reader = Reader.find(1)

      reader.firstname.must_equal "Neeraj"
      reader.lastname.must_equal "Kumar"
      reader.username.must_equal "neeraj"
      reader.email.must_equal "neeraj.kumar@gmail.com"

      reader.studying_materials.size.must_equal 4
      reader.studying_materials.first.title.must_equal @book1.title
      reader.studying_materials.second.title.must_equal @book2.title
    end
  end

  it "should return one user for belongs_to_resource association" do
    User.stub :find, @user do 
      book = Book.create(title: "New Book", user_id: @user.id)
      book.user.must_equal @user
    end
  end

  it "should return one user for has_one_activeresource association" do
    User.stub :find, @user do 
      account = Account.create(user_id: @user.id)
      account.user.must_equal @user
    end
  end

  it "should return many users for has_and_belongs_to_many_activeresources association" do
    User.stub :find, [] do 
      image = Image.create(filename: "profile_pic.jpg")
      assert image.users.empty?
      image.users << @user
      assert !image.users.empty?
      assert image.users.include?(@user)
    end
  end
end
