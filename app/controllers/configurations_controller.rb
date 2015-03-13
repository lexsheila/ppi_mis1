class ConfigurationsController < ApplicationController

	 def show
	 	#@configuration=Configurations.find(params[:id])
  	 end

  	 def new
   		 @configuration = Configurations.new
  	 end


  	 def create
	    @configuration = Configurations.new(params[:configuration].permit(:password_expiration, :password_length, :password_history_count, :entries_till_lock, :successive_password_entry, :inactive_terminal_closure))
	      if @configurations.save #save the configurations
	        flash[:notice1] = "New configurations created"
	        redirect_to new_admin_path
	      else          
	        @configuration.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"configurations", :action=>"update" 
	          return false 
	        end

	      end
	  end

	  def update
		# @configuration = Configurations.new(configuration_params)
	    respond_to do |format|
	      if @configuration.update(configuration_params)
	        format.html { redirect_to @configuration, notice: 'Configurations were successfully updated.' }
	        format.json { render :show, status: :ok, location: @configuration }
	      else
	        format.html { render :edit }
	        format.json { render json: @configuration.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	   private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_configuration
	      @configuration = Configurations.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def configuration_params
	      #params[:configurations]
	      params.require(:configuration).permit(:password_expiration, :password_length, :password_history_count, :entries_till_lock, :successive_password_entry, :inactive_terminal_closure)
	    end
end