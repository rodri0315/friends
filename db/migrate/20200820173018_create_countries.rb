class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|

      t.string :display_name,            null: false, default: ""
      t.string :country_code,            null: false, default: ""

      t.timestamps
    end
  end
end
