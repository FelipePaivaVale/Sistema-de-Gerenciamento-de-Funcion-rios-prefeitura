class AddEmailAndTelefoneToFuncionarios < ActiveRecord::Migration[7.1]
  def change
    add_column :funcionarios, :email, :string
    add_column :funcionarios, :telefone, :string
  end
end
