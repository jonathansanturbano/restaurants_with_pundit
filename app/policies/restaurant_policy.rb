class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    @record.user == @user || @user.admin?
  end
end
