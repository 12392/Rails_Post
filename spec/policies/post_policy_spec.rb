require 'rails_helper'


RSpec.describe PostPolicy, type: :policy do

  #let(:user) {User.new }
  #let(:post) { Post.new }
  subject { PostPolicy }


  permissions :destroy?, :show? do
    it " access granted if post_id is equal to user_id" do
  
      #user = User.create!( email: "example@test.com",  password: "123456")
      user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post,user:user, email:user.email)
      expect(PostPolicy).to permit(user,post)

    end
    it " access not granted if post_id is not equal to user_id" do
      user2 = FactoryGirl.create(:user, email:"example@test4.com" , password: "123456")
      user = FactoryGirl.create(:user, email:"example@test3.com" , password: "123456")
      post = FactoryGirl.create(:post,title:"post100", content:"hello world good morning",user:user, email:user.email)
      expect(PostPolicy).not_to permit(user2,post)
    end
  end
end
