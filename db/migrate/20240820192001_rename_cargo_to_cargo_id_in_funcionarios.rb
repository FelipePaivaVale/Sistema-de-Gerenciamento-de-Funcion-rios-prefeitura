class RenameCargoToCargoIdInFuncionarios < ActiveRecord::Migration[7.1]
  def change
    rename_column :funcionarios, :cargo, :cargo_id
  end
end
