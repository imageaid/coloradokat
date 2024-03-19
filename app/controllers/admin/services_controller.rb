module Admin
  class ServicesController < AdministrationController
    before_action :set_service, only: %i[ show edit update destroy ]

    # GET /services
    def index
      @pagy, @services = pagy(Service.all)
    end

    # GET /services/1
    def show
    end

    # GET /services/new
    def new
      @service = Service.new
    end

    # GET /services/1/edit
    def edit
    end

    # POST /services
    def create
      @service = Service.new(service_params)

      if @service.save
        redirect_to admin_service_path(@service), notice: "Service was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /services/1
    def update
      if @service.update(service_params)
        redirect_to admin_service_path(@service), notice: "Service was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /services/1
    def destroy
      @service.destroy!
      redirect_to admin_services_url, notice: "Service was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_service
        @service = Service.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def service_params
        params.require(:service).permit(:name, :description, :active)
      end
  end
end
