class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    belongs_to :user
    after_create :sent_email
    
    def sent_email
        PostMailer.post_created(self).deliver_later
    end
    
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 10 }
end
