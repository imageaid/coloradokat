# frozen_string_literal: true

module Admin
  class PasswordsController < AdministrationController
    skip_before_action :authenticate_user!

    def new

    end

    def create
      @user = User.find_by(email: params[:email].downcase)
      redirect_to admin_login_path, alert: "No account with that email." and return if @user.nil?

      @user.send_password_reset_email!
      redirect_to admin_login_path, notice: "Password reset instructions have been sent to your email."
    end

    def edit
      @user = User.find_signed(params[:password_reset_token], purpose: :reset_password)
      redirect_to admin_login_path, alert: "Your reset link has expired." if @user.nil?
    end

    def update
      @user = User.find_signed(params[:password_reset_token], purpose: :reset_password)
      redirect_to admin_login_path, alert: "Invalid or expired token." and return if @user.nil?

      if @user.update(password_params)
        redirect_to admin_login_path, notice: "Your password has been reset. Please log in."
      else
        flash.now[:alert] = "Invalid password or token."
        render :edit, status: :unprocessable_entity
      end
    end

    private

      def password_params
        params.require(:user).permit(:password, :password_confirmation)
      end
  end
end

