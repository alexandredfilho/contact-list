class AddRolesToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :roles, :integer
  end
end
