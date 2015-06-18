class UserMailer < ApplicationMailer
	 default from: 'notifications@example.com'
 
	  def password_change(user)
	    @user = user
	    #@url  = 'localhost://users/login'	    
	    mail(to: user.email, subject: 'Welcome to PPI_MIS')
	  end


	  def password_reset(user)
		  @user = user
		  mail :to => user.email, :subject => "Password Reset"
	  end
end
