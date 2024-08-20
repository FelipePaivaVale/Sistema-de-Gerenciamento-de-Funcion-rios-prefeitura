class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false
      t.string :role, default: "gestor de RH"
      t.references :departamento, foreign_key: true

      # Devise modules
      t.datetime :remember_created_at
      t.index :email, unique: true

      t.timestamps
    end
  end
end
