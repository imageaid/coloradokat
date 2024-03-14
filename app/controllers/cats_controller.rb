class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show ]

  # GET /cats
  def index
    @cats = Cat.left_outer_joins(:adoptions).where(adoptions: { cat_id: nil })
  end

  # GET /cats/1
  def show
    adoption = @cat.adoptions.order("adoptions.created_at desc").first
    if adoption
      @adopted = true
      @adoption_date = adoption.adoption_date
    else
      @adopted = false
      @adoption_date = nil
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end
end
