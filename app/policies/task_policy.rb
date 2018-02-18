class TaskPolicy < ApplicationPolicy
  def initialize(user, task )
  	super(user, task)
  end

  def update
  	user.admin? || task.user.eql? user
  end
end
