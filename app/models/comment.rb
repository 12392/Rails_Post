class Comment < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    after_create :sent_email
    
    def sent_email
        CommentMailer.comment_created(self).deliver_later
    end

    validates :comment, presence: true, length: { minimum: 1 }
    validates :post, presence: true
end
