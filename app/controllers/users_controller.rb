class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users action
  def index
    @users = User.all
  end
  
  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(params[:user].permit!)
    #respond_to do |format|
      if @user.save
        redirect_to users_path
        #format.html { redirect_to users_path, notice: 'User was successfully Added.' }
      else
        render action: 'new'
      end
    #end
  end

  # PATCH/PUT /users/1
  def update
    #respond_to do |format|
      if @user.update(user_params)
        redirect_to users_path
        #format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        render action: 'edit'
      end
    #end 
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path}
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit!
    end
  	  
end
