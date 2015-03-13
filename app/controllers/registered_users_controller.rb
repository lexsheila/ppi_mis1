class RegisteredUsersController < ApplicationController

	def show
    @registered_users = RegisteredUser.all
  end

  def new
    @registered_user = RegisteredUser.new
  end

	def create
    	@registered_user = RegisteredUser.new(registered_user_params)

	    respond_to do |format|
	      if @registered_user.save
	        format.html { redirect_to @registered_user, notice: 'Thank you for registering with us. You will receive confirmation within 24 hours' }
	        format.json { render :show, status: :created, location: @registered_user }
	      else
	        format.html { render :new }
	        format.json { render json: @registered_user.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	 #register action
  
  private

  def set_registered_user
      @registered_user = RegisteredUser.find(params[:id])
  end

  def registered_user_params
      #params[:registered_user]
      params.require(:registered_user).permit(:first_name, :last_name, :username, :email)
  end
end
