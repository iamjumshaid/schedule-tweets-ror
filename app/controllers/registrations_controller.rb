class RegistrationsController < ApplicationController
  def new
    Current.user = User.new
  end 

  def create 
    Current.user = User.new(user_params)
    if Current.user.save
        session[:user_id] = Current.user.id
        redirect_to root_path, notice: "Successfully Logged in!"
    else 
        render :new
    end
  end

  private 
  def user_params 
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end 