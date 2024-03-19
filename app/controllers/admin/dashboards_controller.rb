# frozen_string_literal: true

module Admin
  class DashboardsController < AdministrationController
    def index
      @total_pages = Page.count
      @total_photo_sets = PhotoSet.count
      @total_services = Service.count
      @total_cats = Cat.count
    end
  end
end
