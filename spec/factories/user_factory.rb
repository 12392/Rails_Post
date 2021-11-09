FactoryGirl.define do
    factory :user do
        sequence(:email) { |n| "user@email#{n}.com" }
        password "123456"
    end
    factory :post do
        user {FactoryGirl.create(:user)}
        title "Post 1"
        content "jon snow winter is comming"
    end
    factory :comment do
        post {FactoryGirl.create(:post)}
        comment "jon snow winter is comming"
    end
  end