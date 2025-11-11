class UserMailer < ApplicationMailer
  def password_reset(user, password_reset_token)
    @user = user
    @password_reset_token = password_reset_token

    mail to: @user.email, subject: "Password Reset Instructions"
  end

  def contact_request(form_data)
    # form_data can be an ActionController::Parameters object from strong params.
    # Convert to a plain Hash before calling symbolize_keys to avoid NoMethodError.
    hash_data = if defined?(ActionController::Parameters) && form_data.is_a?(ActionController::Parameters)
                  form_data.to_h
                else
                  form_data.respond_to?(:to_h) ? form_data.to_h : (form_data || {})
                end
    @form_data = hash_data.symbolize_keys
    recipient = Rails.application.credentials.dig(:gmail, :username)

    subject = "New contact request from #{@form_data[:first_name]} #{@form_data[:last_name]}".strip
    subject = "New contact request" if subject.blank?

    mail to: recipient,
         from: "Your Website <cokatlady@gmail.com>",
         subject: subject,
         reply_to: @form_data[:email].presence
  end
end
