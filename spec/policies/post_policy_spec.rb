require 'rails_helper'


RSpec.describe PostPolicy, type: :policy do

  let(:user) {User.new }
  let(:post) { Post.new }
  subject { PostPolicy }


  permissions :destroy?, :show? do
    it " access granted if post_id is equal to user_id" do
  
      user = User.create( email: "example@test.com")
      post = Post.create(id:1 ,title:"post100", content:"hello world good morning",user:user,email: "example@test.com")
      expect(PostPolicy).to permit(user,post)

    end
    '''it " access not granted if post_id is not equal to user_id" do
      user2 = User.create(email: "example@test.com")
      post = Post.create(id:1 ,title:"post100", content:"hello world good morning", user:user, email: "example@test.com")
      expect(PostPolicy).not_to permit(user2,post)

      
      #expect(post[:user_id]).to eq(user[:id])
      #expect(subject).not_to permit(@user.id == nil)
    end'''
  end
end
