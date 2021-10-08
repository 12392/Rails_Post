require 'rails_helper'

describe Post, type: :model do
    it 'is valid with attributes' do
        expect(Post.new).to be_valid
    end  
end
