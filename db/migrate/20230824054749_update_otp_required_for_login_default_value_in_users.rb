class UpdateOtpRequiredForLoginDefaultValueInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column_default :users, :otp_required_for_login, from: nil, to: false
  end

  def down
    change_column_default :users, :otp_required_for_login, from: false, to: nil
  end
end
