class AddFieldToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :image_data, :text
  end
end
