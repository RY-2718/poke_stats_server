# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_13_135221) do

  create_table "my_poke_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item"
    t.string "ability"
    t.string "nature"
    t.integer "effort_h"
    t.integer "effort_a"
    t.integer "effort_b"
    t.integer "effort_c"
    t.integer "effort_d"
    t.integer "effort_s"
    t.integer "individual_h"
    t.integer "individual_a"
    t.integer "individual_b"
    t.integer "individual_c"
    t.integer "individual_d"
    t.integer "individual_s"
    t.bigint "my_poke_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.index ["my_poke_id"], name: "index_my_poke_histories_on_my_poke_id"
  end

  create_table "my_poke_history_moves", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "my_poke_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "move_id"
    t.index ["my_poke_history_id"], name: "index_my_poke_history_moves_on_my_poke_history_id"
  end

  create_table "my_pokes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "poke_dex_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_my_pokes_on_user_id"
  end

  create_table "user_tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "google_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "my_poke_histories", "my_pokes"
  add_foreign_key "my_poke_history_moves", "my_poke_histories"
  add_foreign_key "my_pokes", "users"
end
