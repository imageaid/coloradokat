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
require "test_helper"

class PhotoSetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
