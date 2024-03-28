class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    # Default to a staff
    add_column :users, :role, :integer,default: 1
  end
end
