class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_navigation

  private

    def set_navigation
      @pages = Page.where(main_nav: true).order(:title)
    end
end
