class UserRegistration < ActiveRecord::Base

	validates :first_name, :last_name, :username, :email, :presence => true
  	validates :username, :case_sensitive, :length => { :in => 6..20 }, :on => :create 
  	validates :first_name, :last_name, :in => 6..30, :on => :create
  	validates_uniqueness_of :user_name, message: "This username has already been taken."
  	validates_uniqueness_of :email, message: "This email already exists." 
 
end
