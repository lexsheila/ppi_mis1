class PropertyDescriptionsController < ApplicationController
	#respond_to :html, :js
	
	def index
		@property_descriptions = PropertyDescription.all
	end

	def new
    	@property_description = PropertyDescription.new
    end

    def edit
    	@property_description = PropertyDescription.find_by_code(params[:id])
	  if @property_description.update_attributes(params[:property_description])
	    redirect_to property_descriptions_path, :notice => "Property Description has been edited!"
	  else
	    render :edit
	  end	  
	end

	def show
		begin
	      @property_description = PropertyDescription.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	      logger.error "Attempt to access invalid cart #{params[:id]}"
	      redirect_to property_description_url, :notice => 'Invalid cart'
	    else
	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @property_description }
	    end
	  end
	end


	def create
	   @property_description = PropertyDescription.new(params[:property_description].permit(:code, :description))
	      if @property_description.save #save the data
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "Property Description Added" 
	        redirect_to property_descriptions_path
	      else          
	        @property_description.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"property_descriptions", :action=>"new" 
	          return false 
	      end

	    end
	end

	def update
	  @property_description = PropertyDescription.find_by_code(params[:id])
	  if @property_description.update_attributes(params[:property_description])
	    redirect_to property_descriptions_path, :notice => "Property Description has been edited!"
	  else
	    render :edit
	  end
	end

	def destroy
	    @property_description.destroy
	    respond_to do |format|
	      format.html { redirect_to property_descriptions_url, notice: 'Description was successfully deleted.' }
	      format.json { head :no_content }
	    end
  	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_description
      @set_property_description = PropertyDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_description_params
      #params[:valuation_fee]
      params.require(:property_description).permit(:code, :description)
    end
end
