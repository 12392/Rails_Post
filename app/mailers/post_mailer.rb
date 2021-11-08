class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  
  def post_created(post)
    @post = post
    mail(
      from: "support@postApp.com",
      #to: User.where.not(id: @post.user_id).pluck(:email) ---> it will find all emails and send email to all user except Post creator
      to:   "suryanshgupta133@gmail.com", 
      subject: "New Post Created"
    ) 
  end
end
