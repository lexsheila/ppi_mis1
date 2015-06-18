class UserSetting < ActiveRecord::Base

	#validates :password_expiration, :password_length, :password_history_count, :entries_till_lock, 
			 # :successive_password_entry, :inactive_terminal_closure, presence: true
	#validates :password_length, :password_history_count, :entries_till_lock, numericality: { only_integer: true } 
	 

	def password_expiration_string
	  password_expiration.to_s(:db)
	end

	def password_expiration_string=(password_expiration_str)
	  self.password_expiration = Time.parse(password_expiration_str)
	rescue ArgumentError
	  @password_expiration_invalid = true
	end

	def validate
	  errors.add(:password_expiration, "is invalid") if @password_expiration_invalid
	end


end
