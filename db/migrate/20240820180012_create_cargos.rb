
class CreateCargos < ActiveRecord::Migration[7.1]
  def change
    create_table :cargos do |t|
      t.string :nome
      t.text :descricao
      t.references :departamento, null: false, foreign_key: true
      t.string :nivel
      t.decimal :salario_base
      t.text :requisitos
      t.text :beneficios
      t.string :status

      t.timestamps
    end
  end
end