class AddDeviseTwoFactorToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :otp_secret
      t.integer :consumed_timestep
      t.boolean :otp_required_for_login, null: false, default: false
      t.string :otp_backup_codes, array: true
    end
  end
end
