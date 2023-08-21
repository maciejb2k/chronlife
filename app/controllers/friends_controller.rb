class FriendsController < BaseController
  before_action :set_account
  before_action :set_friend, only: :destroy

  def index
    @pagy, @friends = pagy(@account.friends)
  end

  def destroy
    @account.friends.destroy(@friend)
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_friend
    @friend = @account.friends.find(params[:id])
  end
end
