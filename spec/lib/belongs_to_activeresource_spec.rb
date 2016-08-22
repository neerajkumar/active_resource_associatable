require_relative "./../spec_helper"

describe ActiveResourceAssociatable do

  before(:all) do
    @user = FactoryGirl.build(:user)
    Book.delete_all
    @book2 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
    @price = FactoryGirl.build(:price, book_id: @book2.id)
  end

  it "should return one user for belongs_to_resource association for ActiveRecord class" do
    User.stub :find, @user do 
      book = Book.create(title: "New Book", user_id: @user.id)
      book.user.must_equal @user
    end
  end

  it "should return one user for belongs_to_resource association for ActiveResource class" do
    Price.stub :find, @price do
      price = Price.first

      price.book.must_equal @book2
    end
  end

end
