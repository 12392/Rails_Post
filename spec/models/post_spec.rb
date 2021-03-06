require 'rails_helper'

describe Post, type: :model do
    
    it 'is valid with attributes' do
        expect(FactoryGirl.create(:post)).to be_valid
    end  
    
    it 'not valid with attributes' do
        expect(Post.new(title:"", content:"Hello")).not_to be_valid
    end

end
