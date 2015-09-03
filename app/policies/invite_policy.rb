class InvitePolicy < ApplicationPolicy

  def index?
    user.admin? || user.account_owner?
  end

  def show?
    scope.where(:id => record.id).exists?
    user.admin? || user.account_owner?
  end

  def create?
    user.admin? || user.account_owner?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.account_owner?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.account_owner?
  end

end