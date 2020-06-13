class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def update?
    @user == record.user
  end

  def edit?
    update?
  end

  def destroy?
    @user == record.user
  end

end
