class PropertyIdentificationController < ApplicationController

	def new
    	@property_identification = PropertyIdentification.new
    end


	def create
	   @property_identification = PropertyIdentification.new(params[:property_identification].permit(:customer_code, :customer, :tenure_system, :LRV, :folio, :lease_effective_date, 
	   											   	:lease_expiry_date, :lease_tenor, :outstanding_lease_tenor, :unit, :flat, :block, :plot, :road_location, :area, :district,
      												:county, :sub_county, :parish, :LC, :land_area_hectares, :land_area_acres, :built_area, :property_description, :number_of_units,
      												:property_type, :number_of_bedrooms, :property_status, :roof_type, :additional_description))
	      if @property_identification.save #save the data
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "Property Added" 
	        redirect_to property_identification_index_path
	      else          
	        @property_identification.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"property_identification", :action=>"new" 
	          return false 
	      end

	      end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_identification
      @set_property_identification = PropertyIdentification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_identification_params
      #params[:valuation_fee]
      params.require(:property_identification).permit(:customer_code, :customer, :tenure_system, :LRV, :folio, :lease_effective_date, :lease_expiry_date, :lease_tenor,
      												  :outstanding_lease_tenor, :unit, :flat, :block, :plot, :road_location, :area, :district, :county, :sub_county,
      												  :parish, :LC, :land_area_hectares, :land_area_acres, :built_area, :property_description, :number_of_units,
      												  :property_type, :number_of_bedrooms, :property_status, :roof_type, :additional_description)
    end

end
