class AccountPolicy < ApplicationPolicy
  def show?
    account_owner? || friend?
  end

  private

  def account_owner?
    user.account == record
  end

  def friend?
    user.account.friends.exists?(record.id)
  end
end
