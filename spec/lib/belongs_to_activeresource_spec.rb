require_relative "./../spec_helper"

describe ActiveResourceAssociatable do

  before(:all) do
    @user = FactoryGirl.build(:user)
    Book.delete_all
    @book1 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
    @book2 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
    book3 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
    book4 = FactoryGirl.create(:book, user_id: @user.id, reader_id: @user.id)
  end

  it "should return one user for belongs_to_resource association" do
    User.stub :find, @user do 
      book = Book.create(title: "New Book", user_id: @user.id)
      book.user.must_equal @user
    end
  end

end
