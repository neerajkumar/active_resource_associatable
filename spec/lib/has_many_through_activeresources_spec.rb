require_relative "./../spec_helper"

describe ActiveResourceAssociatable do

  before(:all) do
    @user = FactoryGirl.build(:user)
  end

  it "should return many users for has_many_through_activeresources association for ActiveRecord class" do
    User.stub :find, [@user] do 
      friend = Friend.create(firstname: "Neeraj", lastname: "Kumar")
      friendship = Friendship.create(user_id: @user.id, friend_id: friend.id)
      assert !friend.users.empty?
      assert friend.users.include?(@user)
    end
  end

  it "should return many users for has_many_through_activeresources association for ActiveResource class" do
    User.stub :find, @user do
      Friendship.delete_all
      user = User.first
      assert user.friends.empty?
      
      friend = FactoryGirl.create(:friend)
      friendship = Friendship.create(user_id: user.id, friend_id: friend.id)

      assert !user.friends.empty?
      assert user.friends.include?(friend)
    end
  end

end
