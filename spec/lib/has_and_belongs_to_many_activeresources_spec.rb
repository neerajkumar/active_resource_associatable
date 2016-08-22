require_relative "./../spec_helper"

describe ActiveResourceAssociatable do

  before(:all) do
    @user = FactoryGirl.build(:user)
  end

  it "should return many users for has_and_belongs_to_many_activeresources association for ActiveRecord class" do
    Image.delete_all
    ActiveRecord::Base.connection.execute("delete from images_users")
    UserResource.stub :find, [@user] do 
      image = Image.create(filename: "profile_pic.jpg")
      image.users << @user
      ActiveRecord::Base.connection.execute("insert into images_users (user_id, image_id) values (#{@user.id}, #{image.id})")
      assert !image.users.empty?
      assert image.users.include?(@user)
    end
  end

  it "should return many users for has_and_belongs_to_many_activeresources association for ActiveResource class" do
    Image.delete_all
    ActiveRecord::Base.connection.execute("delete from images_users")
    UserResource.stub :find, @user do
      user = UserResource.first
      assert user.images.empty?
      image = Image.create(filename: "profile_pic.png")
      ActiveRecord::Base.connection.execute("insert into images_users (user_id, image_id) values (#{user.id}, #{image.id})")
      assert !user.images.empty?
      assert user.images.include?(image)
    end
  end

end
