module Admin
  class PhotoSetsController < AdministrationController
    before_action :set_photo_set, only: %i[ show edit update destroy ]

    # GET /photo_sets
    def index
      @pagy, @photo_sets = pagy(PhotoSet.all)
    end

    # GET /photo_sets/1
    def show
    end

    # GET /photo_sets/new
    def new
      @photo_set = PhotoSet.new
    end

    # GET /photo_sets/1/edit
    def edit
    end

    # POST /photo_sets
    def create
      @photo_set = PhotoSet.new(photo_set_params)

      if @photo_set.save
        redirect_to admin_photo_set_path(@photo_set), notice: "Photo set was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /photo_sets/1
    def update
      if @photo_set.update(photo_set_params)
        redirect_to admin_photo_set_path(@photo_set), notice: "Photo set was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /photo_sets/1
    def destroy
      @photo_set.destroy!
      redirect_to admin_photo_sets_url, notice: "Photo set was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_photo_set
        @photo_set = PhotoSet.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def photo_set_params
        params.require(:photo_set).permit(:name, :active, photos: [])
      end
  end
end
