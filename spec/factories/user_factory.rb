FactoryGirl.define do
    factory :user do
        email "example@44"
        password "123456"
        #content "Jon Snow"
    end
    factory :post do
        title "Post 1"
        content "jon snow winter is comming"
        #content "Jon Snow"
    end
  end