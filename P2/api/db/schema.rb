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

ActiveRecord::Schema[7.1].define(version: 2024_05_20_134209) do
  create_table "bicicleta", force: :cascade do |t|
    t.string "tipo_manillar"
    t.string "tipo_frenos"
    t.integer "num_frenos"
    t.string "tipo_transmision"
    t.string "tipo_cuadro"
    t.string "tipo_sillin"
    t.string "tipo_ruedas"
    t.integer "num_ruedas"
    t.string "imagen_representativa"
    t.string "tipo_bicicleta"
    t.string "tipo_suspension"
    t.integer "num_suspensiones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "decoraciones"
  end

  create_table "decoracions", force: :cascade do |t|
    t.string "extra"
    t.string "decora_a_type", null: false
    t.integer "decora_a_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decora_a_type", "decora_a_id"], name: "index_decoracions_on_decora_a"
  end

end
