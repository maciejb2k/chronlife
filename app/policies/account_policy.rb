class AccountPolicy < ApplicationPolicy
  def show?
    # user.account == record || user.account.friends.exists?(record.id)
    true
  end
end
