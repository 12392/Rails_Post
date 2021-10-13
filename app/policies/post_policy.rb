class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def initialize(user, post)
    @user = user
    @post = post
  end
  
  def edit?
    if @post.user_id == @user.id
      true
     end
  end
  
  def show?
   if @post.user_id == @user.id
      true
    end
  end
  
  def destroy?
    if @post.user_id == @user.id
      true
    end
  end

end
