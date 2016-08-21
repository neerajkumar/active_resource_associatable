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

  it "should return many books for has_many_activeresources association without class name option" do
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

  it "should return many books for has_many_activeresources association with class name option" do
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

end
