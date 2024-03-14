class AdoptionsController < ApplicationController
  before_action :set_adoption, only: %i[ show edit update destroy ]

  # GET /adoptions
  def index
    @adoptions = Adoption.all
  end

  # GET /adoptions/1
  def show
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
  end

  # GET /adoptions/1/edit
  def edit
  end

  # POST /adoptions
  def create
    @adoption = Adoption.new(adoption_params)

    if @adoption.save
      redirect_to @adoption, notice: "Adoption was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /adoptions/1
  def update
    if @adoption.update(adoption_params)
      redirect_to @adoption, notice: "Adoption was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /adoptions/1
  def destroy
    @adoption.destroy!
    redirect_to adoptions_url, notice: "Adoption was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adoption_params
      params.require(:adoption).permit(:cat_id, :adopter_id, :adoption_date)
    end
end
