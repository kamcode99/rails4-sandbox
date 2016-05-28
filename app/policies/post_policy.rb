class PostPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.present? && user == record.user
  end


end
