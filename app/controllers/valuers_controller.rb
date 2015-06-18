class ValuersController < ApplicationController

	def new
    	@valuer = Valuer.new
    end


	def create
	   @valuer = Valuer.new(params[:valuer].permit(:company_name, :TIN_NUMBER, :VAT_NUMBER, :physical_address, :postal_address, :contact_person, 
				      							   :primary_phone_number, :other_phone_number, :fax, :email, :specialization, :legrep_first_name,
				      							   :legrep_last_name, :address, :pri_phone_num, :other_phone_num, :rep_email, :remarks))
	      if @valuer.save #save the user
	        #UserMailer.activation_email(@user).deliver_later
	        flash[:notice1] = "New valuer added" 
	        redirect_to valuers_path
	      else          
	        @valuer.errors.full_messages.each do |message_error|   
	          flash[:notice2] = message_error
	          redirect_to :controller=>"valuer", :action=>"new" 
	          return false 
	      end

	      end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_valuer
      @valuer = Valuer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valuer_params
      #params[:valuer]
      params.require(:valuer).permit(:company_name, :TIN_NUMBER, :VAT_NUMBER, :physical_address, :postal_address, :contact_person, 
      								 :primary_phone_number, :other_phone_number, :fax, :email, :specialization, :legrep_first_name,
      								 :legrep_last_name, :address, :pri_phone_num, :other_phone_num, :rep_email, :remarks)
    end


end
