class UserSessionController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    #user = User.find_by_login(params[:login])
    #respond_to do |format|
        if @user_session.save
          #if params[:remember_me]
          #  cookies.permanent[:auth_token] = user.auth_token
          #else
          #  cookies[:auth_token] = user.auth_token
          #end
          flash[:notice] = "Login successful!"
          redirect_to users_path
          #format.html { redirect_to users_path, notice: 'Login successful!' }
        else
          render :action => :new
        end
    #end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default users_path
  end
end
