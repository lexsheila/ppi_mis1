class UserMailer < ApplicationMailer
	 default from: 'notifications@example.com'
 
	  def activation_email(user)
	    @user = user
	    @url  = 'localhost://users/login'
	    
	    mail(to: @user.email, subject: 'Welcome to PPI_MIS')
	  end
end
