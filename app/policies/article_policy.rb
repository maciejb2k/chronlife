class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.specialist?
  end

  def edit?
    update?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def owner?
    user.specialist? && user.account == record.account
  end
end
