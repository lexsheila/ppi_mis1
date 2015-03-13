class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
	  def activation_email(user)
	    @user = user
	    @url  = 'localhost://users/login'
	    email_with_name = %("#{@user.first_name}" <#{@user.email}>)
	    mail(to: email_with_name, subject: 'Welcome to PPI_MIS')
	  end
end
