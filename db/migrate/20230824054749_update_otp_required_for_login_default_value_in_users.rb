class UpdateOtpRequiredForLoginDefaultValueInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :otp_required_for_login, false
  end
end
