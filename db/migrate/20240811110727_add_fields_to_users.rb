class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nome, :string
    add_column :users, :nivel, :string
    add_column :users, :departamento, :string
  end
end
