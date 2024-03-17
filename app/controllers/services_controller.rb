class ServicesController < ApplicationController
  # GET /services
  def index
    @services = Service.where(active: true)
  end
end
