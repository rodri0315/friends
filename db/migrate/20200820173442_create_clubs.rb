class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|

      t.string :display_name
      t.string :club_code
      t.text :description
      t.text :internal_notes

      t.timestamps

      t.references :country, index: true, foreign_key: true

    end

    add_index :clubs, :club_code, unique: true
  end
end
