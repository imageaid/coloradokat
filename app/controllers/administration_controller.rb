# frozen_string_literal: true

class AdministrationController < ActionController::Base
  include Authentication
  include Pagy::Backend

  layout "administration"

  before_action :authenticate_user!
end
