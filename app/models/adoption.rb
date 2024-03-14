# == Schema Information
#
# Table name: adoptions
#
#  id            :bigint           not null, primary key
#  adoption_date :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  adopter_id    :bigint           not null
#  cat_id        :bigint           not null
#
# Indexes
#
#  index_adoptions_on_adopter_id  (adopter_id)
#  index_adoptions_on_cat_id      (cat_id)
#
# Foreign Keys
#
#  fk_rails_...  (adopter_id => adopters.id)
#  fk_rails_...  (cat_id => cats.id)
#
class Adoption < ApplicationRecord
  belongs_to :cat
  belongs_to :adopter
end
