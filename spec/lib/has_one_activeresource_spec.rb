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

  it "should return one user for has_one_activeresource association" do
    User.stub :find, @user do 
      account = Account.create(user_id: @user.id)
      account.user.must_equal @user
    end
  end

end
