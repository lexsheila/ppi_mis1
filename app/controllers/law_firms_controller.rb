class LawFirmsController < ApplicationController
	

	def new
    	@law_firm = LawFirm.new
    end


	def create
	   @law_firm = LawFirm.new(params[:law_firm].permit(:company_name, :TIN_NUMBER, :VAT_NUMBER, :physical_address, :postal_address, :contact_person, 
				      							   :primary_phone_number, :other_phone_number, :fax, :email, :specialization, :legrep_first_name,
				      							   :legrep_last_name, :address, :pri_phone_num, :other_phone_num, :rep_email, :remarks))
	      if @law_firm.save #save the user
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "New Law Firm added" 
	        redirect_to law_firms_path
	      else          
	        @law_firm.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"law_firms", :action=>"new" 
	          return false 
	      end

	      end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_law_firm
      @law_firm = LawFirm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def law_firm_params
      #params[:valuer]
      params.require(:law_firm).permit(:company_name, :TIN_NUMBER, :VAT_NUMBER, :physical_address, :postal_address, :contact_person, 
      								 :primary_phone_number, :other_phone_number, :fax, :email, :specialization, :legrep_first_name,
      								 :legrep_last_name, :address, :pri_phone_num, :other_phone_num, :rep_email, :remarks)
    end


end