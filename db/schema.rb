# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_130_122_628) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'service_id', null: false
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['service_id'], name: 'index_bookings_on_service_id'
    t.index ['user_id'], name: 'index_bookings_on_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_categories_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'service_id', null: false
    t.integer 'rating'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['service_id'], name: 'index_reviews_on_service_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'services', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.bigint 'category_id', null: false
    t.string 'status'
    t.string 'comment'
    t.integer 'price', default: 0, null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_services_on_category_id'
    t.index ['user_id'], name: 'index_services_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'name', default: '', null: false
    t.integer 'age', default: 0, null: false
    t.string 'gender', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.string 'role', default: 'seller', null: false
    t.string 'avatar'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['role'], name: 'index_users_on_role'
  end

  add_foreign_key 'bookings', 'services'
  add_foreign_key 'bookings', 'users'
  add_foreign_key 'categories', 'users'
  add_foreign_key 'reviews', 'services'
  add_foreign_key 'reviews', 'users'
  add_foreign_key 'services', 'categories'
  add_foreign_key 'services', 'users'
end
