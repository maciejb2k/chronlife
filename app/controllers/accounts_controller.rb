class AccountsController < BaseController
  layout "dashboard"

  before_action :set_account
  before_action :set_breadcrumbs

  def index
    @pagy, @accounts = pagy(Account.includes(:user).all)
  end

  private

  def set_account
    @account = current_account
  end

  def set_breadcrumbs
    add_breadcrumb "home", authenticated_root_path
    add_breadcrumb "osoby", accounts_path
  end
end
