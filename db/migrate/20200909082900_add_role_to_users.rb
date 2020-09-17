class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def up
    add_reference :users, :role, foreign_key: true
  end

  def down
    remove_reference :users, :role    
  end
end
