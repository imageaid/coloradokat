# frozen_string_literal: true

module Admin
  class SessionsController < AdministrationController
    before_action :redirect_already_logged_in, only: %i[new create]
    skip_before_action :authenticate_user!

    def new

    end

    def create
      user = User.find_by(email: params[:email].downcase)
      redirect_to admin_login_path, alert: "No account with that email." and return unless user

      if user.authenticate(params[:password])
        after_login_path = session[:user_return_to] || admin_dashboards_path
        login(user)
        remember(user) if params[:remember_me].present?
        redirect_to after_login_path, notice: "You have been logged in."
      else
        flash.now[:alert] = "Incorrect email or password."
        render :new, status: :unauthorized
      end

    end

    def destroy
      forget(current_user)
      logout
      redirect_to admin_login_path, notice: "You have been logged out."
    end
  end
end
