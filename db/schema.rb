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

ActiveRecord::Schema.define(version: 20_210_305_182_324) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'game_sets', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_game_sets_on_user_id'
  end

  create_table 'occupations', force: :cascade do |t|
    t.string 'name'
    t.integer 'min_credit'
    t.integer 'max_credit'
    t.string 'calc_type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'game_set_id'
    t.index ['game_set_id'], name: 'index_occupations_on_game_set_id'
    t.index %w[name game_set_id], name: 'index_occupations_on_name_and_game_set_id', unique: true
  end

  create_table 'occupations_picks', id: false, force: :cascade do |t|
    t.bigint 'occupation_id', null: false
    t.bigint 'pick_id', null: false
  end

  create_table 'occupations_skills', id: false, force: :cascade do |t|
    t.bigint 'occupation_id', null: false
    t.bigint 'skill_id', null: false
  end

  create_table 'picks', force: :cascade do |t|
    t.integer 'number_of_picks'
    t.boolean 'pick_any'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'game_set_id'
    t.string 'name'
    t.index ['game_set_id'], name: 'index_picks_on_game_set_id'
    t.index %w[name game_set_id], name: 'index_picks_on_name_and_game_set_id', unique: true
  end

  create_table 'picks_skills', id: false, force: :cascade do |t|
    t.bigint 'skill_id', null: false
    t.bigint 'pick_id', null: false
  end

  create_table 'skills', force: :cascade do |t|
    t.string 'name'
    t.integer 'base_value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'game_set_id'
    t.index ['game_set_id'], name: 'index_skills_on_game_set_id'
    t.index %w[name game_set_id], name: 'index_skills_on_name_and_game_set_id', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'jti', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['jti'], name: 'index_users_on_jti', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end
end
