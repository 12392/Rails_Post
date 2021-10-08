require 'rails_helper'

describe Comment, type: :model do
    it 'is valid with attributes' do
        expect(Comment.new).to be_valid
    end  
end
