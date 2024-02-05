class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role_ids.include?(1)
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    true unless user.role_ids.include?(3)
  end

  def show?
    true unless user.role_ids.include?(3)
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true unless user.role_ids.include?(3)
  end

  def edit?
    update?
  end

  def destroy?
    true unless user.role_ids.include?(3)
  end
end
