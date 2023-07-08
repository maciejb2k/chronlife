module OtpSessionExpirable
  extend ActiveSupport::Concern

  included do
    private

    def expire_otp_session!
      return unless session[:otp_user_id]
      return unless session[:otp_user_id_expires_at]
      return unless session[:otp_user_id_expires_at] < Time.current

      session[:otp_user_id] = nil
      session[:otp_user_id_expires_at] = nil

      redirect_to new_user_session_path
    end
  end
end
