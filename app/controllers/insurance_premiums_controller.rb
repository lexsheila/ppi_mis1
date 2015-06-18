class InsurancePremiumsController < ApplicationController

	def new
    	@insurance_premium = InsurancePremium.new
    end


	def create
	   @insurance_premium = InsurancePremium.new(params[:insurance_premium].permit(:insurance_firm, :premium_amount, :premium_percentage, :remarks))
	      if @insurance_premium.save #save the data
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "Premiums Added" 
	        redirect_to insurance_premiums_path
	      else          
	        @insurance_premium.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"insurance_premiums", :action=>"new" 
	          return false 
	      end

	      end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_premium
      @set_insurance_premium = InsurancePremium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_premium_params
      #params[:valuation_fee]
      params.require(:insurance_premium).permit(:insurance_firm, :premium_amount, :premium_percentage, :remarks)
    end
end
