class UpdateClubs < ActiveRecord::Migration[6.0]
  def up
    remove_column :clubs, :club_code
    
    add_column :clubs, :region, :string
    add_column :clubs, :sub_region, :string
    add_column :clubs, :status, :string
    add_column :clubs, :country_other, :string
    add_column :clubs, :state_province, :string

    add_column :clubs, :club_number, :string, null:false
    add_index :clubs, :club_number, unique: true
  end

  def down
    remove_column :clubs, :club_number

    remove_column :clubs, :region
    remove_column :clubs, :sub_region
    remove_column :clubs, :status
    remove_column :clubs, :country_other
    remove_column :clubs, :state_province

    add_column :clubs, :club_code, :string, null:false
    add_index :clubs, :club_code, unique: true
    
  end
end
