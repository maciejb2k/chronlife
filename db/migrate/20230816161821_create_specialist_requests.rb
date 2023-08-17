class CreateSpecialistRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :specialist_requests, id: :uuid do |t|
      t.string :specialization, null: false, default: ""
      t.string :specialization_description, null: false, default: ""
      t.string :field_of_expertise, null: false, default: ""
      t.string :status, null: false, default: ""
      t.string :hash_code, null: false, default: ""
      t.references :account, type: :uuid, foreign_key: true, null: false

      t.timestamps
    end
  end
end
