class AdoptersController < ApplicationController
  before_action :set_adopter, only: %i[ show edit update destroy ]

  # GET /adopters
  def index
    @adopters = Adopter.all
  end

  # GET /adopters/1
  def show
  end

  # GET /adopters/new
  def new
    @adopter = Adopter.new
  end

  # GET /adopters/1/edit
  def edit
  end

  # POST /adopters
  def create
    @adopter = Adopter.new(adopter_params)

    if @adopter.save
      redirect_to @adopter, notice: "Adopter was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /adopters/1
  def update
    if @adopter.update(adopter_params)
      redirect_to @adopter, notice: "Adopter was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /adopters/1
  def destroy
    @adopter.destroy!
    redirect_to adopters_url, notice: "Adopter was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adopter
      @adopter = Adopter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adopter_params
      params.require(:adopter).permit(:first_name, :last_name, :email, :address_1, :address_2, :city, :state, :postal)
    end
end
