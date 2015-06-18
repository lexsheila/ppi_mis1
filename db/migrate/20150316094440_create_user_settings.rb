class CreateUserSettings < ActiveRecord::Migration
  def change
    create_table :user_settings do |t|

       	t.time 	  :password_expiration
    		t.integer :password_length
    		t.integer :password_history_count
    		t.integer :entries_till_lock
    		t.time    :successive_password_entry
    		t.time    :inactive_terminal_closure

   	    t.timestamps null: false        

    end
  end

end
