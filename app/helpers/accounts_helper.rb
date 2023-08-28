module AccountsHelper
  def current_account?(account)
    account == current_account
  end

  def friend?(account)
    @friends.include?(account.id)
  end

  def sent_friend_request?(account)
    @sent_friend_requests.include?(account.id)
  end

  def received_friend_request?(account)
    @received_friend_requests.include?(account.id)
  end
end
