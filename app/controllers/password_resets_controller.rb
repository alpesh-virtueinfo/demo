class PasswordResetsController < ApplicationController
  
    def create
      user = User.find_by_email(params[:email])
      user.send_password_reset if user
      redirect_to users_path, :notice => "Email sent with password reset instructions."
    end

    def edit
      #@user = User.find_by_password_reset_token!(params[:id])
      @user= current_user
    end

    def update
        @user = User.find(current_user.id)
        if @user.update_attributes(user_params)
            redirect_to users_path, :notice => "Password has been reset!"
        else
            render "edit"
        end
    end

    private

    def user_params
        params.required(:user).permit(:password, :password_confirmation)
    end

end

