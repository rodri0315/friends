class CreateAddresses < ActiveRecord::Migration[6.0]
  def up
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state_province
      t.string :postal_code
      t.string :country_other

      t.timestamps

      t.references :country, index: true, foreign_key: true
      t.references :profile, index: true, foriegn_key: true
    end

    create_table :languages do |t|
      t.string :display_name
      t.string :locale_code

      t.timestamps
    end

    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :phone

      t.string :country_other
      t.string :club_other

      t.text :bio
      t.integer :year_joined
      t.string :member_id

      t.boolean :also_english

      t.string :facebook
      t.string :twitter
      t.string :whatsapp

      t.timestamps

      t.references :country, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :club, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
    end

  end


  def down
    drop_table :addresses, if_exists: true
    drop_table :profiles, if_exists: true
    drop_table :languages, if_exists: true
  end
end
