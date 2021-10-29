class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  # User.where.not(id: @user.id).pluck(:email), 
  #   en.post_mailer.post_created.subject
  #
  def post_created(user,post)
    @user = user
    @post = post
   

    mail(
      from: "support@postApp.com",
      to:   "		rajatbajpai33@gmail.com",
      subject: "New Post Created"
    ) 
  end
end
