class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :login_required, :except=>[:index, :login]


  def login_required
		if session[:userid]
			return true			
		end
		flash[:notice1]="Please login to continue"
		redirect_to users_path
		return false
	end

  #checking if a user is an administrator
  def confirm_admin
    unless session[:role] && session[:role]=='Admin'
  	  flash[:notice1] ="you do not have the required priviledges to access this page."
  	  redirect_to users_path
  	  return false # deny access
	  else
	    return true
	  end
  end

end
