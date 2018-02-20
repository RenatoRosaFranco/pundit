class CommentPolicy < ApplicationPolicy
  def initialize(user, comment)
  	@user = user 
  	@comment = comment
  end

  def destroy?
  	@user.admin? or @comment.user.eql?(@user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
