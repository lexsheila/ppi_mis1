class LegalFeesController < ApplicationController

	def new
    	@legal_fee = LegalFee.new
    end


	def create
	   @legal_fee = LegalFee.new(params[:legal_fee].permit(:law_firm, :fees_amount, :fees_percentage, :remarks))
	      if @legal_fee.save #save the data
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "Legal Fees Added" 
	        redirect_to legal_fees_path
	      else          
	        @legal_fee.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"legal_fees", :action=>"new" 
	          return false 
	      end

	      end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_fees
      @set_legal_fee = LegalFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_fee_params
      #params[:valuation_fee]
      params.require(:legal_fee).permit(:law_firm, :fees_amount, :fees_percentage, :remarks)
    end
end
