# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :signed_in?
  end

  def authenticate_user!
    store_location
    redirect_to admin_login_path, alert: "You need to sign in or sign up before continuing." unless signed_in?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_already_logged_in
    redirect_to admin_dashboards_path, notice: "You are already logged in" if signed_in?
  end

  def signed_in?
    Current.user.present?
  end

  def forget(user)
    cookies.delete(:remember_token)
    user.regenerate_remember_token
  end

  def remember(user)
    user.regenerate_remember_token
    cookies.permanent.encrypted[:remember_token] = user.remember_token
  end

  private

    def current_user
      Current.user ||= if session[:current_user_id].present?
                         User.find_by(id: session[:current_user_id])
                       elsif cookies.permanent.encrypted[:remember_token].present?
                          User.find_by(remember_token: cookies.permanent.encrypted[:remember_token])
                       end
    end

    def store_location
      session[:user_return_to] = request.original_url if request.get? && request.local?
    end
end
