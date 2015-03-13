class User < ActiveRecord::Base

  belongs_to :registered_users
  has_many :passwords
	
  attr_accessor :password

  #validating the form for creating new user
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :password, :confirmation => true #password_confirmation attribute
  validates_length_of :password, :in => 8..20, :on => :create
  validates :password, :format => {:with => /A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\W])).+z/, message: "must contain at least one uppercase letter, at least one digit and at least one special character."}
  #validates :role, :presence => true
 
  #call method before appropriate action
  before_save :encrypt_password
  after_save :clear_fields, :create_timestamp

  #method to encrypt user password
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  #method to clear fields
  def clear_fields
    self.password=nil
    self.username=nil
    self.role=nil
  end
  #authenticating a system user
  def self.authenticate(username, password)
    user=find_by_username(username)  #find the user
      #confirm the users password
      if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
          user      
      else
       nil
      end
  end

	
end
