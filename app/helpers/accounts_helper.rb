module AccountsHelper
  def current_account?(account)
    account == current_account
  end

  def friend?(friends, account)
    friends.include?(account.id)
  end
end
