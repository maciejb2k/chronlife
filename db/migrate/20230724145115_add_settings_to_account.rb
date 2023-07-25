class AddSettingsToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :settings, :jsonb, null: false, default: {}
    add_index :accounts, :settings, using: :gin
  end
end
