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
