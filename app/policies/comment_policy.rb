class CommentPolicy < ApplicationPolicy
  def destroy?
    record.account.user == user
  end
end
