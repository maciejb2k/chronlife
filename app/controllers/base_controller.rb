class BaseController < ApplicationController
  include DashboardLayout

  before_action :authenticate_user!
  before_action :user_account_setup

  private

  def user_account_setup
    return if current_account.present?

    redirect_to setup_account_path
  end

  def user_account_already_setup
    return if current_account.blank?

    redirect_to authenticated_root_path
  end
end
