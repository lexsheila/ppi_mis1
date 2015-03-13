class Configuration < ActiveRecord::Base

	validates :password_expiration, :password_length, :password_history_count, :entries_till_lock, 
			  :successive_password_entry, :inactive_terminal_closure :presence => true 
	 

end