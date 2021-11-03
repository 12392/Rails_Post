class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #  @comment.post.user.email
  #   en.comment_mailer.comment_created.subject
  #
  def comment_created(comment)

    @comment=comment
    
    #if @comment.email != @comment.post.user.email

    mail(
      from: "support@postApp.com",
      to: "suryanshgupta133@gmail.com"  ,
      subject: "New Comment Posted"
    ) 
  #end
  end
end
