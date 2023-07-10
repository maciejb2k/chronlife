class BaseUserController < ApplicationController
  before_action :authenticate_user!
  before_action :user_account_setup

  private

  def user_account_setup
    return if current_user.account.present?

    redirect_to setup_account_path
  end

  def user_account_already_setup
    return if current_user.account.blank?

    redirect_to authenticated_root_path
  end
end
