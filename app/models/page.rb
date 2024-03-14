# == Schema Information
#
# Table name: pages
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(TRUE)
#  heading      :string
#  landing_page :boolean          default(FALSE)
#  link_name    :string
#  main_nav     :boolean          default(FALSE)
#  slug         :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_pages_on_slug  (slug) UNIQUE
#
class Page < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged
  has_rich_text :body
  has_one_attached :image
end
