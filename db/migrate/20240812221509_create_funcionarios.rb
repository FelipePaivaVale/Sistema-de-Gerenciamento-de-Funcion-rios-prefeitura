class CreateFuncionarios < ActiveRecord::Migration[7.1]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.date :nascimento
      t.string :genero
      t.string :cpf
      t.string :rg
      t.string :rua
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :cargo
      t.date :contratação
      t.decimal :salario
      t.string :status
      t.references :departamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
