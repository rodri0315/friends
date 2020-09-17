class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :system_name
      t.string :display_name
      
      t.timestamps
    end
  end
end
