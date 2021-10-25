FactoryGirl.define do
    factory :user do
        email "example@44"
        password "123456"
    end
    factory :post do
        title "Post 1"
        content "jon snow winter is comming"
    end
    factory :comment do
        email "example@44"
        comment "jon snow winter is comming"
    end
  end