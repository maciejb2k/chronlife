class CommentPolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def owner?
    record.account.user == user
  end
end
