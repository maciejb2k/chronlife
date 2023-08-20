class AccountsController < BaseController
  layout "dashboard"

  before_action :set_account, only: %i[show edit update destroy]
  before_action :set_breadcrumbs

  def index
    @pagy, @accounts = pagy(Account.includes(:user, :friends, :friend_requests).all)
  end

  def show
    authorize @account
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb "home", authenticated_root_path
    add_breadcrumb "osoby", accounts_path
  end
end
