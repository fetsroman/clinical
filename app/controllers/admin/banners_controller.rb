class Admin::BannersController < AdminsController
  before_action :authorize_request_admin
  before_action :set_banner, only: [:show, :update, :destroy]

  # GET /banners
  def index
    @banners = Banner.all

    render json: @banners
  end

  # GET /banners/1
  def show
    render json: @banner
  end

  # POST /banners
  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      render json: @banner, status: :created, location: @banner
    else
      render json: @banner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /banners/1
  def update
    if @banner.update(banner_params)
      render json: @banner
    else
      render json: @banner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /banners/1
  def destroy
    @banner.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def banner_params
      params.permit(:image, banner_parameters_attributes: [:id, :article, :discount])
    end
end
