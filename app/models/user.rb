# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  remember_token  :string           not null
#  role            :integer          default("guest")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email            (email) UNIQUE
#  index_users_on_first_name       (first_name)
#  index_users_on_last_name        (last_name)
#  index_users_on_password_digest  (password_digest)
#  index_users_on_remember_token   (remember_token) UNIQUE
#
class User < ApplicationRecord
  PASSWORD_RESET_TOKEN_EXPIRATION = 15.minutes

  normalizes :email, with: -> email { email.strip.downcase }

  has_secure_password
  has_secure_password :recovery_password, validations: false
  has_secure_token :remember_token

  enum role: { guest: 0, assistant: 1, admin: 2 }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  attr_accessor :recovery_password_digest

  def generate_password_reset_token
    signed_id expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password
  end

  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_later
  end
end
