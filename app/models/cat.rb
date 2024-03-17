# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  intake_date :date
#  name        :string
#  sex         :integer          default("female")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  has_many :adoptions, dependent: :destroy
  has_many :adopters, through: :adoptions, dependent: :nullify

  has_rich_text :notes
  has_rich_text :medical_notes

  has_many_attached :images

  enum sex: { female: 0, male: 1 }

  attr_accessor :adopted
end
