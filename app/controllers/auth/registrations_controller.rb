class Auth::RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params_attributes
    [:email, :password, :password_confirmation,
     { account_attributes: %i[first_name last_name username birthday] }]
  end

  def sign_up_params
    params.require(:user).permit(sign_up_params_attributes)
  end
end
