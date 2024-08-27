class AddPasswordResetRequiredToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :password_reset_required, :boolean
  end
end
