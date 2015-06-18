class SessionsController < ApplicationController

	def create
    #if request.post?
      #authenticate user
      user = User.authenticate(params[:username], params[:password])
     # require 'pry'; binding.pry
        if user
          #set sessions objects for the user
          session[:userid] = user.id
          session[:role] = user.role
          session[:username]= user.username
            if params[:remember_me]
             cookies.permanent[:auth_token] = user.auth_token
            else
             cookies[:auth_token] = user.auth_token
            end
          flash[:notice] = "WELCOME "+session[:username]

          if session[:role]=="Admin"
            #redirect_to :controller=>"admin", :action=>"index"
            redirect_to admin_index_path
            return true
          elsif session[:role]=="Valuer"
            #redirect to cashier page
            redirect_to admin_index_path
            return true
          end
        else
          flash[:notice1] = "Wrong Username or password"
          redirect_to :controller=>'users'
        end

    end

	def destroy
	  cookies.delete(:auth_token)
	  redirect_to root_url, :notice => "Logged out!"
	end


  end  
