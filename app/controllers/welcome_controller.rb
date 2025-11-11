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

  def send_contact
    form = contact_params

    if form[:email].blank? || form[:message].blank?
      redirect_to contact_path, alert: "Please provide your email and a message." and return
    end

    begin
      UserMailer.contact_request(form).deliver_now
      redirect_to contact_path, notice: "Thanks! Your message has been sent."
    rescue => e
      Rails.logger.error("Contact form email failed: #{e.class} - #{e.message}")
      redirect_to contact_path, alert: "Sorry, we couldn't send your message right now. Please try again later."
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :city, :county, :phone, :message)
    end
end
