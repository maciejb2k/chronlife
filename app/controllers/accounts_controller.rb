class AccountsController < BaseController
  before_action :set_account, only: %i[show edit update destroy]
  before_action :set_breadcrumbs

  def index
    @pagy, @accounts = pagy(
      Account
      .includes(user: :roles)
      .all
    )
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
