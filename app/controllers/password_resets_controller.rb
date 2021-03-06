class PasswordResetsController < ApplicationController

	def index
	end

	def create
	   user = User.find_by_email(params[:email])
	   if user
	   	user.send_password_reset
	  	redirect_to root_url, :notice => "Email sent with password reset instructions."
	  #redirect_to new_password_reset_url, :notice => "Email sent with password reset instructions."
	   else
	   	@no_user = "User not found"
	   	redirect_to 'password_resets/new'
	   end
	end

	def edit
	  @user = User.find_by_password_reset_token(params[:id])
	end

	def update
	  @user = User.find_by_password_reset_token(params[:id])
	  if @user.password_reset_sent_at < 24.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif 
      #@user.update_attributes(params.require(:user).permit(:password))

	  	@user.update_attributes(params[:user])
	    redirect_to root_url, :notice => "Password has been reset!"
	  else
	    render :edit
	  end
	end


end
