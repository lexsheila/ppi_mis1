class AdminController < ApplicationController
	before_filter :confirm_admin

	def index
	end

	def show
    @registered_users = RegisteredUser.all
	end

	def create
    @configurations = Configurations.new(params[:configurations].permit(:password_expiration, :password_length, :password_history_count, 
    						:entries_till_lock, :successive_password_entry, :inactive_terminal_closure))
      if @user.save #save the user
        flash[:notice1] = "New user created"
        redirect_to new_admin_path
      else          
        @user.errors.full_messages.each do |message_error|   
          flash[:notice2] = message_error
          redirect_to :controller=>"admin", :action=>"new" 
          return false 
        end

      end
  end
end
