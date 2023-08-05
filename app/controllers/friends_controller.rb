class FriendsController < BaseController
  layout "dashboard"

  before_action :set_account
  before_action :set_friend, only: :destroy

  def index
    @pagy, @friends = pagy(@account.friends)
  end

  def destroy
    current_account.friends.destroy(@friend)
    head :no_content
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_friend
    @friend = current_account.friends.find(params[:id])
  end
end
