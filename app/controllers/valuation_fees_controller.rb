class ValuationFeesController < ApplicationController
	def new
    	@valuation_fee = ValuationFee.new
    end


	def create
	   @valuation_fee = ValuationFee.new(params[:valuation_fee].permit(:valuer, :fees_amount, :fees_percentage, :remarks))
	      if @valuation_fee.save #save the data
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "Valuations Added" 
	        redirect_to valuation_fees_path
	      else          
	        @valuation_fee.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"valuation_fees", :action=>"new" 
	          return false 
	      end

	      end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_valuation_fee
      @set_valuation_fee = ValuationFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valuation_fee_params
      #params[:valuation_fee]
      params.require(:valuation_fee).permit(:valuer, :fees_amount, :fees_percentage, :remarks)
    end


end
