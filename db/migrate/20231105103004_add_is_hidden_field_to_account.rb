class AddIsHiddenFieldToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :is_hidden, :boolean, null: false, default: false
  end
end
