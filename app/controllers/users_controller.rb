class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_filter :confirm_admin, :except=>[:help]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  #login action
  def login
    if request.post?
      #authenticate user
      user = User.authenticate(params[:username], params[:password])
        if user
          #set sessions objects for the user
          session[:userid] = user.id
          session[:role] = user.role
          session[:user_name]= user.username
          flash[:notice] = "WELCOME "+session[:user_name]

          if session[:role]=="Admin"
            redirect_to :controller=>"admin", :action=>"index"
            #redirect_to admin_index_path
            return true
          elsif session[:role]=="Cashier"
            #redirect to cashier page
            redirect_to admin_index_path
            return true
          end
        else
          flash[:notice1] = "Wrong Username or password"
          redirect_to :controller=>'users'
        end
    end
  end  
  
  def logout
  session.delete(:userid)
  session.delete(:user_name)
  session.delete(:role)
  flash[:notice] = "GOODBYE!!"
  redirect_to users_path
end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      #params[:user]
      params.require(:user).permit(:username, :role, :password, :password_confirmation)
    end
end
