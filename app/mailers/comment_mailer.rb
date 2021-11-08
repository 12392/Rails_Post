class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #  @comment.post.user.email
  #   en.comment_mailer.comment_created.subject
  #
  def comment_created(comment)
    @comment = comment
    #if @comment.email != @comment.post.user.email ---> it will avoid sending email to Post creator commenting on his own post
      mail(
      from: "support@postApp.com",
      #to:@comment.post.user.email ---> it will find email of Post creator and send email to him when any body create post
      to: "suryanshgupta133@gmail.com",
      subject: "New Comment Posted"
    ) 
  #end
end
end
