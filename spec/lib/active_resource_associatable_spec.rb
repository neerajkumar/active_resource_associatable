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
    User.stubs(:find).returns(@user)
    @book1 = FactoryGirl.create(:book, user_id: @user.id)
    @book2 = FactoryGirl.create(:book, user_id: @user.id)
    book3 = FactoryGirl.create(:book, user_id: @user.id)
    book4 = FactoryGirl.create(:book, user_id: @user.id)
  end
  
  it "should return many books for has_many_activeresources association without class name" do
    user = User.find(1)

    expect(user.firstname).to eq("Neeraj")
    expect(user.lastname).to eq("Kumar")
    expect(user.username).to eq("neeraj")
    expect(user.email).to eq("neeraj.kumar@gmail.com")

    expect(user.books.size).to eq(4)
    expect(user.books.first.title).to eq(@book1.title)
    expect(user.books.second.title).to eq(@book2.title)
  end

  it "should return many books for has_many_activeresources association with class name" do
    Reader.stubs(:find).returns(@user)
    reader = Reader.find(1)

    expect(reader.firstname).to eq("Neeraj")
    expect(reader.lastname).to eq("Kumar")
    expect(reader.username).to eq("neeraj")
    expect(reader.email).to eq("neeraj.kumar@gmail.com")

    expect(reader.books.size).to eq(4)
    expect(reader.books.first.title).to eq(@book1.title)
    expect(reader.books.second.title).to eq(@book2.title)
  end

  it "should return one user for belongs_to_resource association" do
    book = Book.create(title: "New Book", user_id: @user.id)
    expect(book.user).to eq(@user)
  end

  it "should return one user for has_one_activeresource association" do
    account = Account.create(user_id: @user.id)
    expect(account.user).to eq(@user)
  end

  it "should return many users for has_and_belongs_to_many_activeresources association" do 
    image = Image.create(filename: "profile_pic.jpg")

    puts image.users.inspect
  end
end
