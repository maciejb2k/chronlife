class AddTosAgreementToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tos_agreement, :boolean, null: false, default: false
  end
end
