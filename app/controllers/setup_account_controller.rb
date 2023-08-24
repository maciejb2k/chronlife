class SetupAccountController < BaseController
  layout "application"

  skip_before_action :user_account_setup
  before_action :user_account_already_setup

  def new
    @user = current_user
    @account = @user.build_account
  end

  def create
    @user = current_user
    @account = @user.build_account(account_params)

    if @account.save
      redirect_to authenticated_root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :username)
  end
end
