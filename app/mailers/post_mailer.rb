class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created(user,post)
    @user = user
    @post = post
   

    mail(
      from: "support@postApp.com",
      to:   User.where.not(id: @user.id).pluck(:email), 
      subject: "New Post Created"
    ) 
  end
end
