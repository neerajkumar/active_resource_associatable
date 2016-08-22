require_relative "./../spec_helper"

describe ActiveResourceAssociatable do

  before(:all) do
    @user = FactoryGirl.build(:user)
  end

  it "should return one user for has_one_activeresource association for ActiveRecord class" do
    User.stub :find, @user do 
      account = Account.create(user_id: @user.id)
      account.user.must_equal @user
    end
  end

  it "should return one user for has_one_activeresource association for ActiveResource class" do
    reader = FactoryGirl.build(:reader)
    Reader.stub :find, reader do
      reader = Reader.first
      account = Account.create(reader_id: reader.id)
      reader.account.must_equal account
    end
  end

end
