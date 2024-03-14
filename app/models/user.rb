# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  first_name :string
#  last_name  :string
#  role       :integer          default("guest")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email       (email) UNIQUE
#  index_users_on_first_name  (first_name)
#  index_users_on_last_name   (last_name)
#
class User < ApplicationRecord
  normalizes :email, with: -> email { email.strip.downcase }

  enum role: { guest: 0, admin: 1 }

  validates :email, presence: true, uniqueness: true
end
