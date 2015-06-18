class UserSettingsController < ApplicationController

	 def show
	 	@user_setting=UserSetting.all
  	 end

  	 def new
   		 @user_setting = UserSetting.new
  	 end


  	 def create
	    @user_setting = UserSetting.new(params[:user_settings].permit(:password_expiration, :password_length, :password_history_count, :entries_till_lock, :successive_password_entry, :inactive_terminal_closure))
	      if @user_setting.save #save the configurations
	        flash[:notice1] = "New settings"
	        redirect_to user_settings_path
	      else          
	        @user_setting.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"user_settings", :action=>"create" 
	          return false 
	        end

	      end
	  end

	  def update
		# @configuration = Configurations.new(configuration_params)
	    respond_to do |format|
	      if @user_setting.update(user_setting_params)
	        format.html { redirect_to @user_setting, notice: 'Settings were successfully updated.' }
	        format.json { render :show, status: :ok, location: @user_setting }
	      else
	        format.html { render :edit }
	        format.json { render json: @user_setting.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	   private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_user_settings
	      @user_setting = UserSetting.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def user_settings_params
	      #params[:user_settings]
	      params.require(:user_settings).permit(:password_expiration, :password_length, :password_history_count, :entries_till_lock, :successive_password_entry, :inactive_terminal_closure)
	    end
end

