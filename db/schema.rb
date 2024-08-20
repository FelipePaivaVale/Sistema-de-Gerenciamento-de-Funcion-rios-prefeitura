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

ActiveRecord::Schema[7.1].define(version: 2024_08_20_210653) do
  create_table "cargos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.bigint "departamento_id", null: false
    t.string "nivel"
    t.decimal "salario_base", precision: 10
    t.text "requisitos"
    t.text "beneficios"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_cargos_on_departamento_id"
  end

  create_table "departamentos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "codigo"
    t.string "localizacao"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.date "nascimento"
    t.string "genero"
    t.string "cpf"
    t.string "rg"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "cep"
    t.string "cargo_id"
    t.date "contratação"
    t.decimal "salario", precision: 10
    t.string "status"
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "telefone"
    t.index ["departamento_id"], name: "index_funcionarios_on_departamento_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", null: false
    t.string "role", default: "gestor de RH"
    t.bigint "departamento_id"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_users_on_departamento_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cargos", "departamentos"
  add_foreign_key "funcionarios", "departamentos"
  add_foreign_key "users", "departamentos"
end
