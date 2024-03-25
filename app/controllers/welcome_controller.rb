class WelcomeController < ApplicationController
  def index
    # @services = Rails.cache.fetch('services', expires_in: 1.day) do
    #   Service.where(active: true).order("RANDOM()").limit(6)
    # end
    # photo_set = Rails.cache.fetch('photo_set', expires_in: 1.day) do
    #   PhotoSet.where(active: true).order("RANDOM()").first
    # end
    @services = Service.where(active: true).order("RANDOM()").limit(6)
    photo_set = PhotoSet.where(active: true).order("RANDOM()").first
    @photos = photo_set.present? ? photo_set.photos.shuffle : []
    render layout: "landing"
  end

  def contact
    
  end
end
