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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
