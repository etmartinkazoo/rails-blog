class PostPolicy < ApplicationPolicy
  def index?
    user.role_ids.include?(1) || user.role_ids.include?(2)
  end

  def show?
    user.role_ids.include?(1) || user.role_ids.include?(2)
  end

  def create?
    user.role_ids.include?(1) || user.role_ids.include?(2)
  end

  def new?
    create?
  end

  def update?
    user.role_ids.include?(1) || user.role_ids.include?(2)
  end

  def edit?
    update?
  end

  def destroy?
    user.role_ids.include?(1)
  end
end
