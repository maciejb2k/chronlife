class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions, id: :uuid do |t|
      t.string :reaction_type, null: false, default: ""
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :reactable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end

    add_index :reactions,
              %i[account_id reactable_id reactable_type],
              unique: true, name: "index_unique_user_reactable"
  end
end
