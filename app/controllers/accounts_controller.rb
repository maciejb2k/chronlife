class AccountsController < BaseController
  before_action :set_account, only: %i[show edit update destroy]
  before_action :set_breadcrumbs

  def index
    @pagy, @accounts = pagy(
      Account
      .joins(user: :roles)
      .includes(user: :roles)
      .order(:username)
      .all
    )

    @friends = current_account.friends.pluck(:id)
    @sent_friend_requests = current_account.sent_friend_requests.pluck(:friend_id)
    @received_friend_requests = current_account.received_friend_requests.pluck(:account_id)
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), accounts_path
  end
end
