class Admin::BannersController < AdminsController
  before_action :authorize_request_admin
  before_action :set_banner, only: [:update]

  # GET /banners
  def index
    @banners = Banner.all.first

    render json: @banners
  end

  # PATCH/PUT /banners/1
  def update
    if @banner.update(banner_params)
      render json: @banner
    else
      render json: @banner.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def banner_params
      if params[:banner_parameters_attributes].is_a? String
        params[:banner_parameters_attributes] = JSON.parse params[:banner_parameters_attributes]
      end
      params.permit(:image, :link, banner_parameters_attributes: [:id, :article, :discount])
    end
end
