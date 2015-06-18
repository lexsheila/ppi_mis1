class PropertyTypesController < ApplicationController


	def index
		@property_types = PropertyType.all
	end

	def new
    	@property_type = PropertyType.new
    end

    def edit
	  
	end


	def create
	   @property_type = PropertyType.new(params[:property_type].permit(:code, :description))
	      if @property_type.save #save the data
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "Property Type Added" 
	        redirect_to property_types_path
	      else          
	        @property_type.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"property_types", :action=>"new" 
	          return false 
	      end

	    end
	end

	def update
	  @property_type = PropertyType.find_by_code(params[:id])
	  if @property_type.update_attributes(params[:property_type])
	    redirect_to property_types_path, :notice => "Property Description has been edited!"
	  else
	    render :edit
	  end
	end

	def destroy
	    @property_type.destroy
	    respond_to do |format|
	      format.html { redirect_to property_type_url, notice: 'Property Type was successfully deleted.' }
	      format.json { head :no_content }
	    end
  	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_type
      @set_property_type = PropertyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_type_params
      #params[:valuation_fee]
      params.require(:property_type).permit(:code, :description)
    end
end
