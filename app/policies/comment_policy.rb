class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def initialize(user, comment)
    @user = user
    @comment = comment
  end
 
  def destroy?
    if @user == @comment.user  
      true
    elsif @user.email == @comment.post.user.email
      true
    end
  end

  def update?
    if @user == @comment.user
      true
    end
  end
end
