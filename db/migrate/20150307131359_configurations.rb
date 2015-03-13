class Configurations < ActiveRecord::Migration
  def self.up  	
    create_table :configurations do |t|
    t.time 	  :password_expiration, null: false
		t.integer :password_length, null: false
		t.integer :password_history_count, null: false
		t.integer :entries_till_lock, null: false
		t.time    :successive_password_entry, null: false
		t.time    :inactive_terminal_closure, null: false

    t.timestamps null: false

        #add_column :password_expiration, :successive_password_entry, :inactive_terminal_closure :time, :null => false
  		#add_column :password_length, :password_history_count, :entries_till_lock :integer, :null => false

    end
  end

  def self.down
	drop_table :configurations
  end

end