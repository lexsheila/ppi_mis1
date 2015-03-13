class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.integer :userid
      t.string :username
	  t.string :encrypted_password
	  t.string :salt
	  t.timestamp :date_created
	  t.time :duration_of_use
	  
      t.timestamps null: false
    end
  end
end
