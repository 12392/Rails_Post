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
    if current_user.email == @comment.email
      true
    end
 
  end


end
