# == Schema Information
#
# Table name: adopters
#
#  id         :bigint           not null, primary key
#  address_1  :string
#  address_2  :string
#  city       :string
#  email      :string
#  first_name :string
#  last_name  :string
#  postal     :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Adopter < ApplicationRecord
end
