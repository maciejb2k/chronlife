class Auth::RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params_attributes
    [:email, :password, :password_confirmation, :tos_agreement,
     { account_attributes: %i[first_name last_name username birthday] }]
  end

  def sign_up_params
    params.require(:user).permit(sign_up_params_attributes)
  end

  def after_inactive_sign_up_path_for(_resource)
    new_user_session_path
  end
end
