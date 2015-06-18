class User < ActiveRecord::Base

  #has_many :passwords
	
  attr_accessor :password

  #validating the form for creating new user
  validates :username, presence: true #:message => "Username can't be blank." #:uniqueness => true, :length => { :in => 3..20 }
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  # validates :password, confirmation: true #password_confirmation attribute
  # validates :email, presence: true
  # validates :password, length: { in: 8..20 }, :on => :create
  #validates_uniqueness_of :username, message: "This username has already been taken."
  #validates_uniqueness_of :email, message: "This email already exists." 
  #validates :first_name, :last_name, :username, :email, :presence => true, :on => :create 
  #validates :password, :format => {:with => /A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\W])).+\z/, message: "must contain at least one uppercase letter, at least one digit and at least one special character."}
  
  #validates :role, :presence => true
 
  #call method before appropriate action
  before_save :encrypt_password
  # after_save :clear_fields
  before_save { generate_token(:auth_token) }

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
    self.role=nil
    self.username=nil
    self.email=nil
    self.password_confirmation=nil
    #self.email=nil
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

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_later
  end

#3def generate_token(column)
   # self.password_reset_token = SecureRandom.urlsafe_base64
  #end

  def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end
end
