class RegisteredUser < ActiveRecord::Base
	has_many :users

	validates :first_name, :last_name, :username, :email, :presence => true, :on => :create 
  	validates :username, :case_sensitive, :length => { :in => 6..30 }, :on => :create 
  	#validates :first_name, :last_name, :on => :create
  	validates_uniqueness_of :username, message: "This username has already been taken."
  	validates_uniqueness_of :email, message: "This email already exists." 

  	after_save :clear_fields

  	def clear_fields
    self.first_name=nil
    self.last_name=nil
    self.username=nil
    self.email=nil
  end
end
