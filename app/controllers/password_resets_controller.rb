class PasswordResetsController < ApplicationController
    def new

    end

    def create
    @user = User.find_by(email: params[:email])

    if @user.present?
        PasswordMailer.with(user:@user).reset.deliver_later

    end
    redirect_to root_path, notice: "We have sent you the email to reset your password"
    end

    def reset 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature 
        redirect_to signin_path, alert: "Your token has expired, please generate again!"
    end

    def edit 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to signin_path, notice: "Password resetted sucessfull! Login with your new password now."
        else 
            render :reset
        end

    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end