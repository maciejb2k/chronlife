class AddIsNormExceededToMeasurements < ActiveRecord::Migration[7.0]
  def change
    add_column :measurements, :is_norm_exceeded, :boolean, null: false, default: false
  end
end
