# frozen_string_literal: true

class AdministrationController < ActionController::Base
  include Authentication
  include ApplicationHelper
  include Pagy::Backend

  layout "administration"

  before_action :authenticate_user!
end
