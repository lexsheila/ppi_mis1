class PasswordChangesController < ApplicationController

	def index
	end

	def create	   
	end

	def edit
	  @user = User.find_by_auth_token(params[:id])
	end

	def update
		#require 'pry'; binding.pry
	  @user = User.find_by_auth_token(params[:id])
	  #if @user.password_change_sent_at < 24.hours.ago
	   # redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  if @user.update_attributes(params.require(:user).permit(:password))
	    redirect_to root_url, :notice => "Password has been changed! Login with your new credentials."
	  else
	    render :edit
	  end
	end


end
