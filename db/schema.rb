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

ActiveRecord::Schema.define(version: 2018_10_19_080102) do

  create_table "battle_my_poke_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "battle_id"
    t.bigint "my_poke_history_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_id"], name: "index_battle_my_poke_histories_on_battle_id"
    t.index ["my_poke_history_id"], name: "index_battle_my_poke_histories_on_my_poke_history_id"
  end

  create_table "battle_opp_pokes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "battle_id"
    t.bigint "opp_poke_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_id"], name: "index_battle_opp_pokes_on_battle_id"
    t.index ["opp_poke_id"], name: "index_battle_opp_pokes_on_opp_poke_id"
  end

  create_table "battles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "my_rate"
    t.integer "opp_rate"
    t.string "opp_name"
    t.boolean "win"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.index ["user_id"], name: "index_battles_on_user_id"
  end

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

  create_table "opp_poke_moves", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "move_id"
    t.bigint "opp_poke_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opp_poke_id"], name: "index_opp_poke_moves_on_opp_poke_id"
  end

  create_table "opp_pokes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ability"
    t.string "item"
    t.text "memo"
    t.string "nature"
    t.integer "poke_dex_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_opp_pokes_on_user_id"
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

  add_foreign_key "battle_my_poke_histories", "battles"
  add_foreign_key "battle_my_poke_histories", "my_poke_histories"
  add_foreign_key "battle_opp_pokes", "battles"
  add_foreign_key "battle_opp_pokes", "opp_pokes"
  add_foreign_key "battles", "users"
  add_foreign_key "my_poke_histories", "my_pokes"
  add_foreign_key "my_poke_history_moves", "my_poke_histories"
  add_foreign_key "my_pokes", "users"
  add_foreign_key "opp_poke_moves", "opp_pokes"
  add_foreign_key "opp_pokes", "users"
end
