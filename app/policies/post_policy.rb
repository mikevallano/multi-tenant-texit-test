class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.admin? || user.account_owner? || user.manager?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.account_owner? || user.manager? #|| record_owner?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

end