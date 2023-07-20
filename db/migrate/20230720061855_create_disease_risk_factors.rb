class CreateDiseaseRiskFactors < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_risk_factors, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.integer :severity, null: false, default: 1
      t.references :disease, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
