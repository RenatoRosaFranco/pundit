class TaskPolicy < ApplicationPolicy
  def initialize(user, task)
  	@user = user
  	@task = task
  end

  def edit?
  	@user.admin? || @task.user == @user
  end

  def update?
  	@user.admin? || @task.user == @user
  end

  def destroy?
  	@user.admin? || @task.user == @user
  end
end
