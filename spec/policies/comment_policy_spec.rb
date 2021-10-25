require 'rails_helper'

RSpec.describe CommentPolicy, type: :policy do

  subject { CommentPolicy }

  permissions :update? do
    it " access granted if user_email is equal to comment_email" do
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment)
      expect(subject).to permit(user,comment)
    end
    it " access not granted if user_email is not equal to comment_email" do
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment , email:"example@test4.com")
      expect(subject).not_to permit(user,comment)
    end
  end
 
  permissions :destroy? do
    it " access granted if user_email is equal to comment_email" do
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment)
      expect(subject).to permit(user,comment)
    end
    it " access not granted if user_email is not equal to comment_email" do
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment , email:"example@test5.com")
      expect(subject).not_to permit(user,comment)
    end
  end
end
