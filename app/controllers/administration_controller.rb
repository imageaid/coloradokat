# frozen_string_literal: true

class AdministrationController < ActionController::Base
  include Pagy::Backend

  layout "administration"

end
