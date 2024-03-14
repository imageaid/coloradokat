# == Schema Information
#
# Table name: photo_sets
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PhotoSet < ApplicationRecord
  has_many_attached :photos

  validates :name, presence: true
end
