# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_20_140643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "username"
    t.text "bio", default: "", null: false
    t.string "sex", default: "", null: false
    t.date "birthday", default: "1970-01-01", null: false
    t.string "country", default: "", null: false
    t.string "city", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "education", default: "", null: false
    t.boolean "is_verified", default: false, null: false
    t.string "specialization", default: "", null: false
    t.string "specialization_description", default: "", null: false
    t.string "field_of_expertise", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
    t.index ["username"], name: "index_accounts_on_username", unique: true
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "disease_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "icon", default: "", null: false
    t.string "color", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_disease_categories_on_name", unique: true
  end

  create_table "disease_risk_factors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.integer "severity", default: 1, null: false
    t.uuid "disease_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_disease_risk_factors_on_disease_id"
  end

  create_table "disease_symptom_updates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "intensity", default: 0, null: false
    t.date "update_date", null: false
    t.uuid "disease_symptom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_symptom_id"], name: "index_disease_symptom_updates_on_disease_symptom_id"
  end

  create_table "disease_symptoms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.date "first_noticed_at"
    t.uuid "disease_id", null: false
    t.uuid "predefined_symptom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id", "predefined_symptom_id"], name: "index_disease_symptoms_on_disease_id_and_predefined_symptom_id"
    t.index ["disease_id"], name: "index_disease_symptoms_on_disease_id"
    t.index ["predefined_symptom_id"], name: "index_disease_symptoms_on_predefined_symptom_id"
  end

  create_table "diseases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "diagnosed_at"
    t.boolean "diagnosed_by_hp", default: false, null: false
    t.integer "severity", default: 1, null: false
    t.string "color", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "account_id", null: false
    t.uuid "predefined_disease_id", null: false
    t.uuid "disease_category_id"
    t.index ["account_id", "predefined_disease_id"], name: "index_diseases_on_account_id_and_predefined_disease_id", unique: true
    t.index ["account_id"], name: "index_diseases_on_account_id"
    t.index ["disease_category_id"], name: "index_diseases_on_disease_category_id"
    t.index ["predefined_disease_id"], name: "index_diseases_on_predefined_disease_id"
  end

  create_table "predefined_diseases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "related_names", default: [], array: true
    t.text "description", default: "", null: false
    t.string "icd10_code", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_predefined_diseases_on_name", unique: true
  end

  create_table "predefined_symptoms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "related_names", default: [], array: true
    t.text "description", default: "", null: false
    t.uuid "predefined_disease_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_predefined_symptoms_on_name", unique: true
    t.index ["predefined_disease_id"], name: "index_predefined_symptoms_on_predefined_disease_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "treatment_diseases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "treatment_id", null: false
    t.uuid "disease_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_treatment_diseases_on_disease_id"
    t.index ["treatment_id", "disease_id"], name: "index_treatment_diseases_on_treatment_id_and_disease_id", unique: true
    t.index ["treatment_id"], name: "index_treatment_diseases_on_treatment_id"
  end

  create_table "treatment_updates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "status", default: "", null: false
    t.text "description", default: "", null: false
    t.date "update_date", default: -> { "now()" }, null: false
    t.uuid "treatment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treatment_id"], name: "index_treatment_updates_on_treatment_id"
  end

  create_table "treatments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "description", default: "", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_finished", default: false, null: false
    t.integer "effectiveness", default: 0, null: false
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_treatments_on_account_id"
  end

  create_table "user_roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.uuid "role_id", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "otp_secret"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.string "otp_backup_codes", array: true
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "disease_risk_factors", "diseases"
  add_foreign_key "disease_symptom_updates", "disease_symptoms"
  add_foreign_key "disease_symptoms", "diseases"
  add_foreign_key "disease_symptoms", "predefined_symptoms"
  add_foreign_key "diseases", "accounts"
  add_foreign_key "diseases", "disease_categories"
  add_foreign_key "diseases", "predefined_diseases"
  add_foreign_key "predefined_symptoms", "predefined_diseases"
  add_foreign_key "treatment_diseases", "diseases"
  add_foreign_key "treatment_diseases", "treatments"
  add_foreign_key "treatment_updates", "treatments"
  add_foreign_key "treatments", "accounts"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
