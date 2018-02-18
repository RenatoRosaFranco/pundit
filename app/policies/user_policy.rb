class UserPolicy < ApplicationPolicy
  def intialize(user, profile)
  	@user = user
  	@profile = profile
  end

  def admin?
  	@user.admin? || @profile.id == @user.id
  end
end
